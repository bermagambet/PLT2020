open Format
open Syntax
open Support.Error
open Support.Pervasive

(* ------------------------   EVALUATION  ------------------------ *)

exception NoRuleApplies

let rec isnumericval t = match t with
    TmZero(_) -> true
  | TmSucc(_,t1) -> isnumericval t1
  | TmPred(_,t1) -> isnumericval t1
  | _ -> false

let rec isval t = match t with
    TmTrue(_)  -> true
  | TmFalse(_) -> true
  | t when isnumericval t  -> true
  | _ -> false

let rec eval1 t = match t with
    TmIf(_,TmTrue(_),t2,t3) ->
      t2
  | TmIf(_,TmFalse(_),t2,t3) ->
      t3
  | TmIf(fi,t1,t2,t3) ->
      let t1' = eval1 t1 in
      TmIf(fi, t1', t2, t3)
  | TmSucc(fi,t1) ->
      let t1' = eval1 t1 in
      TmSucc(fi, t1')
  | TmPred(_,TmZero(_)) ->
      TmZero(dummyinfo)
  | TmPred(_,TmSucc(_,nv1)) when (isnumericval nv1) ->
      nv1
  | TmPred(fi,t1) ->
      let t1' = eval1 t1 in
      TmPred(fi, t1')
  | TmIsZero(_,TmZero(_)) ->
      TmTrue(dummyinfo)
  | TmIsZero(_,TmSucc(_,nv1)) when (isnumericval nv1) ->
      TmFalse(dummyinfo)
  | TmIsZero(fi,t1) ->
      let t1' = eval1 t1 in
      TmIsZero(fi, t1')
  | _ -> 
      raise NoRuleApplies


let rec eval2 t = match t with
    TmIf(_,TmTrue(_),t2,t3) ->  (*B-If-True*)
      eval2 t2
  | TmIf(_,TmFalse(_),t2,t3) -> (*B-If-False*)
      eval2 t3
  | TmSucc(fi,t1) when (isnumericval t1) -> (*B-Succ*)
      let t1' = eval2 t1 in 
      TmSucc(fi,t1')
  | TmPred(_,TmZero(fi)) ->  (*B-Pred-Zero*)
      TmZero(dummyinfo)
  | TmPred(_,TmSucc(_,nv1)) when (isnumericval nv1) ->   (*B-Pred-Succ*)
      nv1
  | TmIsZero(_,TmZero(_)) -> (*B-IsZero-Zero*)
      TmTrue(dummyinfo)
  | TmIsZero(_,TmSucc(_,nv1)) when (isnumericval nv1) ->    (*B-IsZero-Succ*)
      TmFalse(dummyinfo)
  | _ ->
      raise NoRuleApplies

let rec eval t =
  try let t' = eval2 t
      in eval t'
  with NoRuleApplies -> t
