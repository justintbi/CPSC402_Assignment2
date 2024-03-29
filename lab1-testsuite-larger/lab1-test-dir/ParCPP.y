-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParCPP where
import AbsCPP
import LexCPP
import ErrM

}

%name pProgram Program
%name pDef Def
%name pListDef ListDef
%name pArg Arg
%name pListArg ListArg
%name pStm Stm
%name pListStm ListStm
%name pDecl Decl
%name pListDecl ListDecl
%name pInit Init
%name pType1 Type1
%name pType2 Type2
%name pType3 Type3
%name pListType ListType
%name pType Type
%name pQConst QConst
%name pElmt Elmt
%name pListElmt ListElmt
%name pExp1 Exp1
%name pExp2 Exp2
%name pExp3 Exp3
%name pExp4 Exp4
%name pExp8 Exp8
%name pExp9 Exp9
%name pExp10 Exp10
%name pExp11 Exp11
%name pExp12 Exp12
%name pExp13 Exp13
%name pExp14 Exp14
%name pExp15 Exp15
%name pExp16 Exp16
%name pExp Exp
%name pExp5 Exp5
%name pExp6 Exp6
%name pExp7 Exp7
%name pListExp3 ListExp3
%name pListExp11 ListExp11
%name pListString ListString
%name pListId ListId
-- no lexer declaration
%monad { Err } { thenM } { returnM }
%tokentype {Token}
%token
  '!' { PT _ (TS _ 1) }
  '!=' { PT _ (TS _ 2) }
  '%' { PT _ (TS _ 3) }
  '&' { PT _ (TS _ 4) }
  '&&' { PT _ (TS _ 5) }
  '(' { PT _ (TS _ 6) }
  ')' { PT _ (TS _ 7) }
  '*' { PT _ (TS _ 8) }
  '+' { PT _ (TS _ 9) }
  '++' { PT _ (TS _ 10) }
  '+=' { PT _ (TS _ 11) }
  ',' { PT _ (TS _ 12) }
  '-' { PT _ (TS _ 13) }
  '--' { PT _ (TS _ 14) }
  '-=' { PT _ (TS _ 15) }
  '->' { PT _ (TS _ 16) }
  '.' { PT _ (TS _ 17) }
  '/' { PT _ (TS _ 18) }
  ':' { PT _ (TS _ 19) }
  '::' { PT _ (TS _ 20) }
  ';' { PT _ (TS _ 21) }
  '<' { PT _ (TS _ 22) }
  '<<' { PT _ (TS _ 23) }
  '<=' { PT _ (TS _ 24) }
  '=' { PT _ (TS _ 25) }
  '==' { PT _ (TS _ 26) }
  '>' { PT _ (TS _ 27) }
  '>=' { PT _ (TS _ 28) }
  '>>' { PT _ (TS _ 29) }
  '?' { PT _ (TS _ 30) }
  '[' { PT _ (TS _ 31) }
  ']' { PT _ (TS _ 32) }
  'bool' { PT _ (TS _ 33) }
  'const' { PT _ (TS _ 34) }
  'do' { PT _ (TS _ 35) }
  'double' { PT _ (TS _ 36) }
  'else' { PT _ (TS _ 37) }
  'false' { PT _ (TS _ 38) }
  'for' { PT _ (TS _ 39) }
  'if' { PT _ (TS _ 40) }
  'inline' { PT _ (TS _ 41) }
  'int' { PT _ (TS _ 42) }
  'main' { PT _ (TS _ 43) }
  'return' { PT _ (TS _ 44) }
  'struct' { PT _ (TS _ 45) }
  'throw' { PT _ (TS _ 46) }
  'true' { PT _ (TS _ 47) }
  'typedef' { PT _ (TS _ 48) }
  'using' { PT _ (TS _ 49) }
  'void' { PT _ (TS _ 50) }
  'while' { PT _ (TS _ 51) }
  '{' { PT _ (TS _ 52) }
  '||' { PT _ (TS _ 53) }
  '}' { PT _ (TS _ 54) }
  L_charac { PT _ (TC $$) }
  L_integ  { PT _ (TI $$) }
  L_doubl  { PT _ (TD $$) }
  L_quoted { PT _ (TL $$) }
  L_Id { PT _ (T_Id $$) }

%%

Char    :: { Char }
Char     : L_charac { (read ( $1)) :: Char }

Integer :: { Integer }
Integer  : L_integ  { (read ( $1)) :: Integer }

Double  :: { Double }
Double   : L_doubl  { (read ( $1)) :: Double }

String  :: { String }
String   : L_quoted {  $1 }

Id :: { Id}
Id  : L_Id { Id ($1)}

Program :: { Program }
Program : ListDef { AbsCPP.PDefs (reverse $1) }
Def :: { Def }
Def : Type Id '(' ListArg ')' '{' ListStm '}' { AbsCPP.DFun $1 $2 $4 (reverse $7) }
    | Type Id '(' ListType ')' ';' { AbsCPP.DFunc $1 $2 $4 }
    | 'inline' Type Id '(' ListArg ')' '{' ListStm '}' { AbsCPP.DFunIL $2 $3 $5 (reverse $8) }
    | 'inline' Type Id '(' ListArg ')' ';' { AbsCPP.DFuncIL $2 $3 $5 }
    | Decl { AbsCPP.DDecl $1 }
    | Type 'main' '(' ListArg ')' '{' ListStm '}' { AbsCPP.DMain $1 $4 (reverse $7) }
    | Init { AbsCPP.DInit $1 }
    | 'struct' Id '{' ListDecl '}' ';' { AbsCPP.DStruct $2 (reverse $4) }
    | 'using' QConst ';' { AbsCPP.DUsing $2 }
    | 'typedef' Type Id ';' { AbsCPP.DTypDef $2 $3 }
ListDef :: { [Def] }
ListDef : {- empty -} { [] } | ListDef Def { flip (:) $1 $2 }
Arg :: { Arg }
Arg : Type Id { AbsCPP.ADecl $1 $2 }
ListArg :: { [Arg] }
ListArg : {- empty -} { [] }
        | Arg { (:[]) $1 }
        | Arg ',' ListArg { (:) $1 $3 }
Stm :: { Stm }
Stm : Exp ';' { AbsCPP.SExp $1 }
    | Decl { AbsCPP.SDecl $1 }
    | Init { AbsCPP.SInit $1 }
    | 'while' '(' Exp ')' Stm { AbsCPP.SWhile $3 $5 }
    | 'for' '(' Stm Exp ';' Exp ')' Stm { AbsCPP.SFor $3 $4 $6 $8 }
    | 'do' Stm 'while' '(' Exp ')' ';' { AbsCPP.SDoWhile $2 $5 }
    | '{' ListStm '}' { AbsCPP.SBlock (reverse $2) }
    | 'if' '(' Exp ')' Stm { AbsCPP.SIf $3 $5 }
    | 'if' '(' Exp ')' Stm 'else' Stm { AbsCPP.SIfElse $3 $5 $7 }
    | Type Id '(' ListArg ')' '{' Stm '}' { AbsCPP.SMethod $1 $2 $4 $7 }
    | 'typedef' Type { AbsCPP.STypDef $2 }
    | 'struct' Id '{' ListDecl '}' ';' { AbsCPP.SStruct $2 (reverse $4) }
    | 'return' Exp ';' { AbsCPP.SReturn $2 }
    | 'return' ';' { AbsCPP.SReturnVoid }
ListStm :: { [Stm] }
ListStm : {- empty -} { [] } | ListStm Stm { flip (:) $1 $2 }
Decl :: { Decl }
Decl : Type ListId ';' { AbsCPP.DDef $1 $2 }
ListDecl :: { [Decl] }
ListDecl : {- empty -} { [] } | ListDecl Decl { flip (:) $1 $2 }
Init :: { Init }
Init : Type Id '=' Exp ';' { AbsCPP.IDef $1 $2 $4 }
Type1 :: { Type }
Type1 : Type2 '&' { AbsCPP.TypRef $1 } | Type2 { $1 }
Type2 :: { Type }
Type2 : 'const' Type3 { AbsCPP.TypConst $2 } | Type3 { $1 }
Type3 :: { Type }
Type3 : QConst { AbsCPP.TypQC $1 }
      | 'void' { AbsCPP.TypVoid }
      | 'int' { AbsCPP.TypInteger }
      | 'double' { AbsCPP.TypDouble }
      | 'bool' { AbsCPP.TypBool }
      | '(' Type ')' { $2 }
ListType :: { [Type] }
ListType : {- empty -} { [] }
         | Type { (:[]) $1 }
         | Type ',' ListType { (:) $1 $3 }
Type :: { Type }
Type : Type1 { $1 }
QConst :: { QConst }
QConst : ListElmt { AbsCPP.QDef $1 }
Elmt :: { Elmt }
Elmt : Id { AbsCPP.NId $1 }
     | Id '<' ListType '>' { AbsCPP.NBrac $1 $3 }
ListElmt :: { [Elmt] }
ListElmt : Elmt { (:[]) $1 } | Elmt '::' ListElmt { (:) $1 $3 }
Exp1 :: { Exp }
Exp1 : 'throw' Exp2 { AbsCPP.EThrow $2 } | Exp2 { $1 }
Exp2 :: { Exp }
Exp2 : Exp2 '?' Exp3 ':' Exp3 { AbsCPP.ECondit $1 $3 $5 }
     | Exp2 '+=' Exp3 { AbsCPP.EPlusEq $1 $3 }
     | Exp2 '-=' Exp3 { AbsCPP.EMinEq $1 $3 }
     | Exp2 '=' Exp3 { AbsCPP.EAss $1 $3 }
     | Exp3 { $1 }
Exp3 :: { Exp }
Exp3 : Exp3 '||' Exp4 { AbsCPP.EOr $1 $3 } | Exp4 { $1 }
Exp4 :: { Exp }
Exp4 : Exp4 '&&' Exp5 { AbsCPP.EAnd $1 $3 } | Exp5 { $1 }
Exp8 :: { Exp }
Exp8 : Exp8 '!=' Exp9 { AbsCPP.ENEq $1 $3 }
     | Exp8 '==' Exp9 { AbsCPP.EEq $1 $3 }
     | Exp9 { $1 }
Exp9 :: { Exp }
Exp9 : Exp9 '>=' Exp10 { AbsCPP.EGEq $1 $3 }
     | Exp9 '<=' Exp10 { AbsCPP.ELEq $1 $3 }
     | Exp9 '>' Exp10 { AbsCPP.EGt $1 $3 }
     | Exp9 '<' Exp10 { AbsCPP.ELt $1 $3 }
     | Exp10 { $1 }
Exp10 :: { Exp }
Exp10 : Exp10 '>>' Exp11 { AbsCPP.ERShift $1 $3 }
      | Exp10 '<<' ListExp11 { AbsCPP.ELShift $1 $3 }
      | Exp11 { $1 }
Exp11 :: { Exp }
Exp11 : Exp11 '-' Exp12 { AbsCPP.EMinus $1 $3 }
      | Exp11 '+' Exp12 { AbsCPP.EPlus $1 $3 }
      | Exp12 { $1 }
Exp12 :: { Exp }
Exp12 : Exp12 '%' Exp13 { AbsCPP.EMod $1 $3 }
      | Exp12 '/' Exp13 { AbsCPP.EDiv $1 $3 }
      | Exp12 '*' Exp13 { AbsCPP.ETimes $1 $3 }
      | Exp13 { $1 }
Exp13 :: { Exp }
Exp13 : '!' Exp14 { AbsCPP.ENegBool $2 }
      | '--' Exp14 { AbsCPP.EDecr $2 }
      | '++' Exp14 { AbsCPP.EIncr $2 }
      | Exp14 { $1 }
Exp14 :: { Exp }
Exp14 : '*' Exp15 { AbsCPP.EPointer $2 }
      | Exp15 '--' { AbsCPP.EPostDecr $1 }
      | Exp15 '++' { AbsCPP.EPostIncr $1 }
      | Exp14 '->' Exp15 { AbsCPP.EAssPointer $1 $3 }
      | Exp14 '.' Exp15 { AbsCPP.ERefCall $1 $3 }
      | Exp15 { $1 }
Exp15 :: { Exp }
Exp15 : Exp16 '[' Exp11 ']' { AbsCPP.EArray $1 $3 }
      | Exp16 '(' ListExp3 ')' { AbsCPP.ECall $1 $3 }
      | Exp16 { $1 }
Exp16 :: { Exp }
Exp16 : QConst { AbsCPP.EQConst $1 }
      | 'true' { AbsCPP.ETrue }
      | 'false' { AbsCPP.EFalse }
      | ListString { AbsCPP.EString $1 }
      | Char { AbsCPP.EChar $1 }
      | Integer { AbsCPP.EInteger $1 }
      | Double { AbsCPP.EDouble $1 }
      | '(' Exp ')' { $2 }
Exp :: { Exp }
Exp : Exp1 { $1 }
Exp5 :: { Exp }
Exp5 : Exp6 { $1 }
Exp6 :: { Exp }
Exp6 : Exp7 { $1 }
Exp7 :: { Exp }
Exp7 : Exp8 { $1 }
ListExp3 :: { [Exp] }
ListExp3 : {- empty -} { [] }
         | Exp3 { (:[]) $1 }
         | Exp3 ',' ListExp3 { (:) $1 $3 }
ListExp11 :: { [Exp] }
ListExp11 : Exp11 { (:[]) $1 } | Exp11 ListExp11 { (:) $1 $2 }
ListString :: { [String] }
ListString : String { (:[]) $1 } | String ListString { (:) $1 $2 }
ListId :: { [Id] }
ListId : Id { (:[]) $1 } | Id ',' ListId { (:) $1 $3 }
{

returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++
  case ts of
    []      -> []
    [Err _] -> " due to lexer error"
    t:_     -> " before `" ++ id(prToken t) ++ "'"

myLexer = tokens
}

