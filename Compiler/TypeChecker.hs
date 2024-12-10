-- lastMod: 24 outubro 
module Compiler.TypeChecker where 


import Compiler.Lexer

type Ctx = [(String, Ty)]

typeof :: Ctx -> Expr -> Maybe Ty
-- basic types (Num 10, BFalse, BTrue)
typeof _ (Num _)   = Just TNum
typeof _ BTrue     = Just TBool
typeof _ BFalse    = Just TBool
-- for priority of evaluation
typeof ctx (Par e) = typeof ctx e
-- arithmetic operations: 
--                       typeof (Op (Num 1) (Num 2))
typeof ctx (Add e1 e2) = case (typeof ctx e1, typeof ctx e2) of
                         (Just TNum, Just  TNum) -> Just TNum
                         _ -> Nothing
typeof ctx (Sub e1 e2) = case (typeof ctx e1, typeof ctx e2) of
                         (Just TNum, Just  TNum) -> Just TNum
                         _ -> Nothing
typeof ctx (Mul e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                         (Just TNum, Just  TNum) -> Just TNum
                         _ -> Nothing
-- logic operations: 
--                       typeof (Op (BTrue) (BFalse))
typeof ctx (And e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                         (Just TBool, Just  TBool) -> Just TBool
                         _ -> Nothing
typeof ctx (Or e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                         (Just TBool, Just  TBool) -> Just TBool
                         _ -> Nothing
typeof ctx (Not e1) = case typeof ctx e1 of 
                         (Just TBool) -> Just TBool
                         _ -> Nothing
-- logic operations with Bool or Num: 
--                      typeof (Eq (BTrue) (BTrue)) 
--                      typeof (Eq (Num) (Num))
typeof ctx (Eq e1 e2) = case (typeof ctx e1, typeof ctx e2) of  -- e1 e2 must have the same type for comparision
                         (Just t1, Just t2) | t1 == t2 -> Just TBool -- comparisions always returns bool
                                            | otherwise -> Nothing
                         _ -> Nothing
-- logic operations with Num: 
--                       typeof (Gte (Num) (Num))
typeof ctx (Gte e1 e2) = case (typeof ctx e1, typeof ctx e2) of -- e1 e2 must have the same type for comparision
                         (Just TNum, Just TNum) -> Just TBool -- comparisions always returns bool
                         _ -> Nothing
-- conditional 
--                        typeof (If BTrue (Num 1) (Num 2)) 
typeof ctx (If e e1 e2) = case typeof ctx e of -- e must be a boolean expression
                            (Just TBool) -> case (typeof ctx e1, typeof ctx e2) of -- e1 e2 must have the same type for consistent return 
                                (Just t1, Just t2) | t1 == t2 -> Just t1
                                                   | otherwise -> Nothing                                
                            _ -> Nothing
-- simple var 
typeof ctx (Var v) = lookup v ctx
-- lambda 
typeof ctx (Lam v t1 b) = let Just t2 = typeof ((v, t1) : ctx) b
                            in Just (TFun t1 t2)
-- lambda application App (Lam) (Param Value)
typeof ctx (App e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                            (Just (TFun t11 t12), Just t2) | t11 == t2 -> Just t12
                                                           | otherwise -> Nothing
                            _ -> Nothing
-- list
typeof ctx (Lst []) = Nothing   -- for consistency reasons: Empty = Nothing
typeof ctx (Lst [e]) = case typeof ctx e of 
                                (Just TBool) -> Just (TLst TBool)
                                (Just TNum) -> Just (TLst TNum)
                                _ -> Nothing
typeof ctx (Lst (e:es)) = case (typeof ctx e, typeof ctx (Lst es)) of 
                                (Just t1, Just (TLst t2)) | t1 == t2 -> Just (TLst t1)
                                                          | otherwise -> Nothing
                                _ -> Nothing
-- list constructor 
--                          1:2:3:[4,5,6]
typeof ctx (LstCon e1 e2) = case (typeof ctx e1, typeof ctx e2) of 
                                 (Just (TLst t1), Just t2) | t1 == t2 -> Just t1
                                                           | otherwise -> Nothing 
                                 (Just t2, Just (TLst t1)) | t1 == t2 -> Just t1
                                                           | otherwise -> Nothing
                                 (Just t1, Just t2)        | t1 == t2 -> Just t1
                                                           | otherwise -> Nothing
                                 _ -> Nothing
-- list operations 
typeof ctx (IsNull lst@(Lst e1)) = typeof ctx lst
typeof ctx (IsNull _) = Nothing
typeof ctx (Head lst@(Lst e1)) = typeof ctx lst
typeof ctx (Head _) = Nothing
typeof ctx (Tail lst@(Lst e1)) = typeof ctx lst
typeof ctx (Tail _) = Nothing


typecheck :: Expr -> Expr
typecheck e = case typeof [] e of
                (Just _) -> e
                _ -> error ("erro verificando tipo da expressão: " ++ show e)