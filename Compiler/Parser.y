{
module Parser where 

import Lexer
}

%name parser 
%tokentype { Token }
%error     { parseError }

%token 
  true  { TokenTrue }
  false { TokenFalse }
  num   { TokenNum $$ }
  var   { TokenVar $$ }
  '+'   { TokenAdd }
  '-'   { TokenSub }
  '*'   { TokenMul }
  and   { TokenAnd }
  or    { TokenOr }
  not   { TokenNot }
  "=="  { TokenEq }
  ">="  { TokenGte }
  if	   { TokenIf }
  then  { TokenThen }
  else  { TokenElse }
  "->"  { TokenArrow }
  '\\'  { TokenLam }
  '('   { TokenPOpen }
  ')'   { TokenPClose }
  '['   { TokenBOpen }
  ']'   { TokenBClose }
  ':'   { TokenDDots }
  ','   { TokenComma }
  Num   { TokenTyNum }
  Bool  { TokenTyBool }
  Lst   { TokenTyLst }
  null  { TokenIsNull }
  head  { TokenHead }
  tail  { TokenTail }

%nonassoc if then else 
%nonassoc "->" '\\' '('  ')'  '['  ']'  ',' 
%nonassoc Num Bool true false num var -- Lst 
%nonassoc null head tail

%left not
%left "==" ">=" 
%right ':' -- useful for list constructor
%left '+' '-' and or
%left '*' 

%% 

Exp : true     { BTrue }
    | false    { BFalse }
    | num      { Num $1 }
    | var      { Var $1 }
    | Exp '+' Exp   { Add $1 $3 }
    | Exp '-' Exp   { Sub $1 $3 }
    | Exp '*' Exp   { Mul $1 $3 }
    | Exp and Exp   { And $1 $3 }
    | Exp or Exp    { Or $1 $3 }
    | not Exp       { Not $2 }
    | Exp "==" Exp	{ Eq $1 $3 }
    | Exp ">=" Exp	{ Gte $1 $3 }
    | '(' Exp ')'   { Par $2 }
    | if Exp then Exp else Exp               { If $2 $4 $6 }
    | '\\' '(' var ':' Type "->" Exp ')'     { Lam $3 $5 $7 }
    | Exp Exp       { App $1 $2 }
    | '[' LExp ']'  { Lst $2 }
    | Exp ':' Exp   { LstCon $1 $3 }
    | null Exp    { IsNull $2 }
    | head Exp    { Head $2 }
    | tail Exp    { Tail $2 }

-- https://haskell-happy.readthedocs.io/en/latest/using.html#parsing-sequences
LExp : {- empty -}       { [] }
     | Exp               {[$1]}
     | Exp ',' LExp      { $1 : $3}

Type : Num  { TNum }
     | Bool { TBool }
     | Lst Type { TLst $2 }
     | '(' Type "->" Type ')' { TFun $2 $4 }

{
parseError :: [Token] -> a
parseError ts = error "Syntax error: sequência de instruções inválidas"
}
