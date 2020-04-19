/* Task 1 */


/* test 1*/

Tenge = {amount : Float};
Euro = {amount : Float};
Dollar = {amount : Float};
Rub = {amount : Float};

tg = {amount = 250.5} as Tenge;
eu = {amount = 5.5} as Euro;
usd = {amount = 2500.5} as Dollar;
rb = {amount = 55.5} as Rub;

Currency = <tenge : Tenge, euro : Euro, usdo : Dollar, rubl : Dollar>;

curr1 = <tenge=tg> as Currency;
curr2 = <euro=eu> as Currency;
curr3 = <usdo=usd> as Currency;
curr4 = <rubl=rb> as Currency;

doubleT = lambda x:Tenge. ({amount = timesfloat 5.0 x.amount} as Euro);
doubleE = lambda x:Euro. {amount = timesfloat 1.0 x.amount} as Euro;
doubleT1 = lambda x:Dollar. ({amount = timesfloat 1.5 x.amount} as Euro);
doubleE1 = lambda x:Rub. {amount = timesfloat 100.0 x.amount} as Euro;

doubleT2 = lambda x:Tenge. ({amount = timesfloat 5.0 x.amount} as Dollar);
doubleE2 = lambda x:Euro. {amount = timesfloat 1.0 x.amount} as Dollar;
doubleT3 = lambda x:Dollar. ({amount = timesfloat 5.0 x.amount} as Dollar);
doubleE3 = lambda x:Rub. {amount = timesfloat 1.0 x.amount} as Dollar;

doubleT4 = lambda x:Tenge. ({amount = timesfloat 5.0 x.amount} as Tenge);
doubleE4 = lambda x:Euro. {amount = timesfloat 100.0 x.amount} as Tenge;
doubleT5 = lambda x:Dollar. ({amount = timesfloat 5.0 x.amount} as Tenge);
doubleE5 = lambda x:Rub. {amount = timesfloat 1.0 x.amount} as Tenge;

doubleT6 = lambda x:Tenge. ({amount = timesfloat 5.0 x.amount} as Rub);
doubleE6 = lambda x:Euro. {amount = timesfloat 1.0 x.amount} as Rub;
doubleT7 = lambda x:Dollar. ({amount = timesfloat 5.0 x.amount} as Rub);
doubleE7 = lambda x:Rub. {amount = timesfloat 1.0 x.amount} as Rub;


convertEuro = lambda v:Currency.
case v of
<tenge=x> ==> doubleT x
| <euro = x> ==> doubleE x
| <usdo = x> ==> doubleT1 x
| <rubl = x> ==> doubleE1 x;

convertDollar = lambda v:Currency.
case v of
<tenge=x> ==> doubleT2 x
| <euro = x> ==> doubleE2 x
| <usdo = x> ==> doubleT3 x
| <rubl = x> ==> doubleE3 x;

convertTenge = lambda v:Currency.
case v of
<tenge=x> ==> doubleT4 x
| <euro = x> ==> doubleE4 x
| <usdo = x> ==> doubleT5 x
| <rubl = x> ==> doubleE5 x;

convertRub = lambda v:Currency.
case v of
<tenge=x> ==> doubleT6 x
| <euro = x> ==> doubleE6 x
| <usdo = x> ==> doubleT7 x
| <rubl = x> ==> doubleE7 x;

Currencies = <tenge: Unit, euro: Unit, dollar: Unit, rub: Unit>;
curr1enum = <euro=unit> as Currencies;

convertEuroEuro = lambda z:Euro. {amount = z.amount} as Euro; 
convertTengeEuro = lambda z:Tenge. {amount = z.amount} as Euro; 

convertMoney = lambda v:Currency. lambda z: Currencies. convertTenge v;

convertMoney2 = lambda v:Currency. lambda z: Currencies. convertEuro;

convertMoney3 = lambda v:Currency. lambda z: Currencies. convertDollar v;

convertMoney4 = lambda v:Currency. lambda z: Currencies. convertRub v;




conv = lambda z: Currencies. lambda aa: Currency.
case z of 
<tenge=y>==> convertTenge aa 
| <euro = y> ==>convertEuro aa
| <dollar = y> ==> convertDollar aa
| <rub = y> ==> convertRub aa;

"===";
conv curr1enum curr1;
"===";

/*Weekday = <monday:Unit, tuesday:Unit, wednesday:Unit,
thursday:Unit, friday:Unit>;
nextBusinessDay = lambda w:Weekday.
case w of <monday=x> ==> <tuesday=unit> as Weekday
| <tuesday=x> ==> <wednesday=unit> as Weekday
| <wednesday=x> ==> <thursday=unit> as Weekday
| <thursday=x> ==> <friday=unit> as Weekday
| <friday=x> ==> <monday=unit> as Weekday;
weekd = <monday = unit> as Weekday;
nextBusinessDay weekd;*/

/* test 2*/


Tenge = {amount : Float, name : String};
t = {amount = 250.5, name = "Tenge" } as Tenge;
Euro = {amount : Float, name : String};
te = {amount = 100.5, name = "Euro" } as Euro;
Dollar = {amount : Float, name : String};
td = {amount = 50.5, name = "Dollar" } as Dollar;
Rub = {amount : Float, name : String};
tr = {amount = 90.5, name = "Rub" } as Rub;

Currency = <tenge:Tenge, euro:Euro, dollar:Dollar, rub:Rub>;

looseMoney = lambda a:Currency.
  case a of
    <tenge=x> ==> {amount = timesfloat x.amount 1.0, name="Tenge"} as Tenge
  | <euro=y> ==> {amount = timesfloat y.amount 500.0, name="Tenge"} as Euro
  | <dollar=z> ==> {amount = timesfloat z.amount 450.0, name="Tenge"} as Dollar
  | <rub=b> ==> {amount = timesfloat b.amount 25.0, name="Tenge"} as Rub;

curr1 = <tenge = t> as Currency;
curr2 = <euro = te> as Currency;
curr3 = <dollar = td> as Currency;
curr4 = <rub = tr> as Currency;

looseMoney curr1;
looseMoney curr2;
looseMoney curr3;
looseMoney curr4;




convertTenge = lambda a:Currency.
case a of
    <tenge=x> ==> {amount = timesfloat x.amount 1.0, name="Tenge"} as Tenge
  | <euro=y> ==> {amount = timesfloat y.amount 500.0, name="Tenge"} as Euro
  | <dollar=z> ==> {amount = timesfloat z.amount 450.0, name="Tenge"} as Dollar
  | <rub=b> ==> {amount = timesfloat b.amount 25.0, name="Tenge"} as Rub;


convertEuro = lambda a:Currency.
case a of 
    <tenge=x> ==> {amount = timesfloat x.amount 0.002, name="Euro"} as Tenge
  | <euro=y> ==> {amount = timesfloat y.amount 1.0, name="Euro"} as Euro
  | <dollar=z> ==> {amount = timesfloat z.amount 0.9, name="Euro"} as Dollar
  | <rub=b> ==> {amount = timesfloat b.amount 0.05, name="Euro"} as Rub;


convertDollar = lambda a:Currency.
case a of
    <tenge=x> ==> {amount = timesfloat x.amount 0.003, name="Dollar"} as Tenge
  | <euro=y> ==> {amount = timesfloat y.amount 1.11, name="Dollar"} as Euro
  | <dollar=z> ==> {amount = timesfloat z.amount 1.0, name="Dollar"} as Dollar
  | <rub=b> ==> {amount = timesfloat b.amount 0.06, name="Dollar"} as Rub;


convertRub = lambda a:Currency.
case a of
    <tenge=x> ==> {amount = timesfloat x.amount 0.04, name="Rub"} as Tenge
  | <euro=y> ==> {amount = timesfloat y.amount 20.0, name="Rub"} as Euro
  | <dollar=z> ==> {amount = timesfloat z.amount 18.0, name="Rub"} as Dollar
  | <rub=b> ==> {amount = timesfloat b.amount 1.0, name="Rub"} as Rub;

Currency = <tenge:Tenge, euro:Euro, dollar:Dollar, rub:Rub>;
Currencies = <tenge: Unit, euro: Unit, dollar: Unit, rub: Unit>;
convert = lambda c:Currency. lambda v:Currencies.
  case v of 
    <tenge=y> ==> convertTenge c
  | <euro=y> ==> convertEuro c
  | <dollar=y> ==> convertDollar c
  | <rub=y> ==> convertRub c;

tenge1 = <tenge=unit> as Currencies;
euro1 = <euro=unit> as Currencies;
dollar1 = <dollar=unit> as Currencies;
rub1 = <rub=unit> as Currencies;

convertEuro curr1;
convert curr1 tenge1;
convert curr2 euro1;
convert curr3 dollar1;
convert curr4 rub1;

/* Task 2 *//* Task 2 *//* Task 2 *//* Task 2 */
/* Task 2 *//* Task 2 *//* Task 2 *//* Task 2 */


minis = fix (
  lambda f:Nat->Nat->Nat.
    lambda n:Nat. lambda m:Nat.
      if (iszero m) then n
      else pred (f n (pred m))
  );

"===";
minis 2 2;
"===";

equals = fix (
  lambda f:Nat->Nat->Bool.
    lambda n:Nat. lambda m:Nat.
      if (iszero (minis n m)) then iszero( (minis m n))
      else false
);

"===";
equals 1 1;
"===";

greater = fix (
  lambda f:Nat->Nat->Bool.
    lambda n:Nat. lambda m:Nat.
      if (iszero (minis n m)) then false
      else true
);

"===";
greater 1 1;
greater 2 1;
greater 1 2;
"===";

mod = fix (
  lambda f:Nat->Nat->Nat.
    lambda n:Nat. lambda m:Nat.
      if (equals n m) then 0
      else (if (greater n m) then (f(minis n m) m) else n)
);

"===";
mod 15 5;
mod 15 4;
"===";

gcd = fix (
  lambda f:Nat->Nat->Nat.
    lambda n:Nat. lambda m:Nat.
      if (iszero m) then n
      else (f m (mod n m))
  );

"===";
gcd 100 5;
gcd 15 15;
"===";

/* Task 3 */




Null = {
  null:String
};

IntList = <node:({element:Nat, next:IntList, previous:IntList}), null:Null>;

end={null="end"} as Null;
listend=<null=end> as IntList;

/*!!!!!!!!!
The code below actually works, but it fails to append more
than several list nodes, since my list consists of a pair of
header and a list. And with every APPEND process, list becomes
list of list, not an actual list. Then it breaks!!!
*/

/*a=<node=({element=1, next=listend, previous=listend})> as IntList;

appendEl = lambda z:{element:Nat, next:IntList, previous:IntList}. 
lambda b:Nat. lambda k:IntList.
{element=b, next=k, previous=z};  

a1 = appendEl a 2 listend; 
"====";
a1.previous;
a1.previous.next;
a1.previous.element;

a11 = <node={a1.previous.element, a1.previous.next, a1.previous.previous}> as IntList;

*/


/* Task 4 */

/* Task 4 implementation lies inside the core.ml file, and it's also must be 
done in the other library, not the "fullsimple" one 
*/