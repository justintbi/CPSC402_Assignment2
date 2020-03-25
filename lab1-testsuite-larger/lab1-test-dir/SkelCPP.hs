module SkelCPP where

-- Haskell module generated by the BNF converter

import AbsCPP
import ErrM
type Result = Err String

failure :: Show a => a -> Result
failure x = Bad $ "Undefined case: " ++ show x

transId :: Id -> Result
transId x = case x of
  Id string -> failure x
transProgram :: Program -> Result
transProgram x = case x of
  PDefs defs -> failure x
transDef :: Def -> Result
transDef x = case x of
  DFun type_ id args stms -> failure x
  DFunc type_ id types -> failure x
  DFunIL type_ id args stms -> failure x
  DFuncIL type_ id types -> failure x
  DDecl decl -> failure x
  DMain type_ args stms -> failure x
  DInit init -> failure x
  DStruct id decls -> failure x
  DUsing qconst -> failure x
  DTypDef type_ id -> failure x
transArg :: Arg -> Result
transArg x = case x of
  ADecl type_ id -> failure x
transStm :: Stm -> Result
transStm x = case x of
  SExp exp -> failure x
  SDecl decl -> failure x
  SInit init -> failure x
  SWhile exp stm -> failure x
  SFor stm1 exp1 exp2 stm2 -> failure x
  SDoWhile stm exp -> failure x
  SBlock stms -> failure x
  SIf exp stm -> failure x
  SIfElse exp stm1 stm2 -> failure x
  SMethod type_ id args stm -> failure x
  STypDef type_ -> failure x
  SStruct id decls -> failure x
  SReturn exp -> failure x
  SReturnVoid -> failure x
transDecl :: Decl -> Result
transDecl x = case x of
  DDef type_ ids -> failure x
transInit :: Init -> Result
transInit x = case x of
  IDef type_ id exp -> failure x
transType :: Type -> Result
transType x = case x of
  TAmp type_ -> failure x
  TCons type_ -> failure x
  TQConst qconst -> failure x
  TVoid -> failure x
  TInt -> failure x
  TDouble -> failure x
  TBool -> failure x
transQConst :: QConst -> Result
transQConst x = case x of
  QDef elmts -> failure x
transElmt :: Elmt -> Result
transElmt x = case x of
  NId id -> failure x
  NBrac id types -> failure x
transExp :: Exp -> Result
transExp x = case x of
  EThrow exp -> failure x
  ECondit exp1 exp2 exp3 -> failure x
  EPlusEq exp1 exp2 -> failure x
  EMinEq exp1 exp2 -> failure x
  EAss exp1 exp2 -> failure x
  EOr exp1 exp2 -> failure x
  EAnd exp1 exp2 -> failure x
  ENEq exp1 exp2 -> failure x
  EEq exp1 exp2 -> failure x
  EGEq exp1 exp2 -> failure x
  ELEq exp1 exp2 -> failure x
  EGt exp1 exp2 -> failure x
  ELt exp1 exp2 -> failure x
  ERShift exp1 exp2 -> failure x
  ELShift exp exps -> failure x
  EMinus exp1 exp2 -> failure x
  EPlus exp1 exp2 -> failure x
  EMod exp1 exp2 -> failure x
  EDiv exp1 exp2 -> failure x
  ETimes exp1 exp2 -> failure x
  ENegBool exp -> failure x
  EDecr exp -> failure x
  EIncr exp -> failure x
  EPointer exp -> failure x
  EPostDecr exp -> failure x
  EPostIncr exp -> failure x
  EAssPointer exp1 exp2 -> failure x
  ERefCall exp1 exp2 -> failure x
  EArray exp1 exp2 -> failure x
  ECall exp exps -> failure x
  EQConst qconst -> failure x
  ETrue -> failure x
  EFalse -> failure x
  EString strings -> failure x
  EChar char -> failure x
  EInteger integer -> failure x
  EDouble double -> failure x
  ETyped exp type_ -> failure x

