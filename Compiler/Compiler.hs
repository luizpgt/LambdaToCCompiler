module Compiler.Compiler where

import Data.Char (chr)

import Compiler.Lexer 
import Compiler.TypeChecker

gVal :: Expr -> Int
gVal (Num e) = e
gVal _ = -1 

compiler :: Expr -> (String, String)
-- values 
compiler BTrue = ("", "true")
compiler BFalse = ("", "false")
compiler (Num n) = ("", show n)
compiler (Var x) = ("", x)
-- string (Experimental: Works only with string)
compiler (Lst lst)= ("", "\""++ calls ++"\"")
    where
        calls = concatMap (pure . chr . gVal) lst
-- precedence
compiler (Par e) = (funcs, "("++ calls ++")")
    where 
        (funcs,calls) = compiler e
-- arithmetic ops
compiler (Add n n') = (funcs ++ funcs', calls ++ " + " ++ calls')
    where 
        (funcs, calls) = compiler n
        (funcs', calls') = compiler n'
compiler (Sub n n') = (funcs ++ funcs', calls ++ " - " ++ calls')
    where 
        (funcs, calls) = compiler n
        (funcs', calls') = compiler n'
compiler (Mul n n') = (funcs ++ funcs', calls ++ " * " ++ calls')
    where 
        (funcs, calls) = compiler n
        (funcs', calls') = compiler n'
-- logic ops
compiler (And n n') = (funcs ++ funcs', calls ++ " && " ++ calls') 
    where 
        (funcs, calls) = compiler n
        (funcs', calls') = compiler n'
compiler (Or n n') = (funcs ++ funcs', calls ++ " || " ++ calls') 
    where 
        (funcs, calls) = compiler n
        (funcs', calls') = compiler n'
compiler (Eq n n') = (funcs ++ funcs', calls ++ " == " ++ calls') 
    where 
        (funcs, calls) = compiler n
        (funcs', calls') = compiler n'
compiler (Gte n n') = (funcs ++ funcs', calls ++ " >= " ++ calls') 
    where 
        (funcs, calls) = compiler n
        (funcs', calls') = compiler n'
compiler (Not e) = (funcs, "!("++calls++")") 
    where 
        (funcs, calls) = compiler e
-- conditional 
compiler (If e e' e'') = (funcs ++ funcs' ++ funcs'', "("++ calls ++") ? ("++ calls' ++ ") : ("++ calls'' ++")") 
    where 
        (funcs, calls) = compiler e
        (funcs', calls') = compiler e'
        (funcs'', calls'') = compiler e''
--lambda 
compiler lam@(Lam v t b) = (bfuncs ++ funcs, calls) -- when there is >= 2 functions returned, the newest have to appear before in c code
    where 
        funcs = signature ++ "{ return " ++ bcalls ++ "; }\n"
        calls = "f" ++ v
        signature = lamSig lam
        (bfuncs, bcalls) = compiler b
-- application
compiler (App e e') = (funcs, calls)
    where
        -- note the inverse order of the functions:
        funcs = e'funcs ++ efuncs -- when there is >= 2 functions returned, the newest have to appear before in c code
        calls = "("++ ecalls ++")("++ e'calls ++")"
        (efuncs, ecalls) = compiler e
        (e'funcs, e'calls) = compiler e'


lamSig:: Expr -> String
lamSig lam@(Lam v t b) = case typeof [] lam of
    (Just (TFun (TFun t1 t1') (TFun t2 t2'))) -> -- int (*fv(int(*x)(int)))(int)  
        basicTy t2' ++ " (*f" ++ v ++ "("++ basicTy t1' ++ " (*" ++ v ++ ")("++ basicTy t1 ++ ")))("++ basicTy t2 ++")"
    (Just (TFun (TFun t1 t1') t2)) -> -- int fx(int (*x)(int))
        basicTy t2 ++ " f" ++ v ++ "("++ basicTy t1' ++ " (*" ++ v ++ ")("++ basicTy t1 ++ "))"
    (Just (TFun t1 (TFun t2 t2'))) -> -- \(x: Num -> \(y: Num -> 3))
        basicTy t2' ++ " (*f" ++ v ++ "("++ basicTy t1 ++ " " ++ v ++"))("++ basicTy t2 ++")"
    (Just (TFun t1 t2)) ->
         basicTy t2 ++ " f" ++ v ++ "("++ basicTy t1 ++ " " ++ v ++ ")" 
lamSig _ = "Signature Error: Bad Usage"


basicTy :: Ty -> String
basicTy TNum = "int"
basicTy TBool = "bool"
basicTy (TLst TNum) = "char*"
basicTy _ = "basicTy Error: Bad Usage"


callCode :: String -> Maybe Ty -> (String, String, String)
callCode call (Just (TFun t t')) = (icCall, varName, formatSpec)
    where
        varName = filter (`elem` "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890") call
        icCall = basicTy t' ++ " (*"++ varName ++ ")("++ basicTy t ++") = " ++ call ++ ";"
        formatSpec = "%d"
callCode call (Just ty) = (icCall, varName, formatSpec)
    where 
        varName = filter (`elem` "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890") call
        icCall = basicTy ty ++ " " ++ varName ++ " = " ++ call ++ ";"
        formatSpec | ty == TLst TNum = "%s"
                   | otherwise = "%d"