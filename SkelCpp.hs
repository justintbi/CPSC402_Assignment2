module SkelCpp where

-- Haskell module generated by the BNF converter

import AbsCpp
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
  DFunc type_ id args -> failure x
  DUsing qconst -> failure x
  DTypDef type_ id -> failure x
  DTypDefVect type_ types id -> failure x
  DDeclVar type_ ids -> failure x
transArg :: Arg -> Result
transArg x = case x of
  ADecl type_ id -> failure x
  AType type_ -> failure x
  AConst type_ id -> failure x
  AConstType type_ -> failure x
transStm :: Stm -> Result
transStm x = case x of
  SExp exp -> failure x
  SDecls declaration -> failure x
  SInit declaration exp -> failure x
  SReturn exp -> failure x
  SReturnVoid -> failure x
  SWhile exp stm -> failure x
  SBlock stms -> failure x
  SIfElse exp stm contd -> failure x
  SDoWhi stm exp -> failure x
  SFor stm1 exp1 exp2 stm2 -> failure x
  STypDef type_ id -> failure x
transDeclaration :: Declaration -> Result
transDeclaration x = case x of
  DeclaSim type_ ids -> failure x
  DeclaConst type_ id -> failure x
transContd :: Contd -> Result
transContd x = case x of
  YesContd stm -> failure x
  NoContd -> failure x
transExp :: Exp -> Result
transExp x = case x of
  ECondit exp1 exp2 exp3 -> failure x
  EExcept exp -> failure x
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
  ELShift exp1 exp2 -> failure x
  EMinus exp1 exp2 -> failure x
  EPlus exp1 exp2 -> failure x
  EMod exp1 exp2 -> failure x
  EDiv exp1 exp2 -> failure x
  ETimes exp1 exp2 -> failure x
  EPointer exp -> failure x
  ENegBool exp -> failure x
  ENegInt exp -> failure x
  EDecr exp -> failure x
  EIncr exp -> failure x
  EAssPointer exp1 exp2 -> failure x
  ERefCall exp1 exp2 -> failure x
  EArray exp1 exp2 -> failure x
  ECall exp exps -> failure x
  EPostDecr exp -> failure x
  EPostIncr exp -> failure x
  EQConst qconst -> failure x
  ETrue -> failure x
  EFalse -> failure x
  EString strings -> failure x
  EChar char -> failure x
  EInt integer -> failure x
  EDouble double -> failure x
  EPred type_1 type_2 -> failure x
  ETyped exp type_ -> failure x
transQConst :: QConst -> Result
transQConst x = case x of
  QuConst elmts -> failure x
transElmt :: Elmt -> Result
transElmt x = case x of
  QCElmt id -> failure x
  QCElntt id types -> failure x
transType :: Type -> Result
transType x = case x of
  TypInt -> failure x
  TypChar -> failure x
  TypBool -> failure x
  TypVoid -> failure x
  TypDoub -> failure x
  TypQC qconst -> failure x
  TypRef type_ -> failure x

