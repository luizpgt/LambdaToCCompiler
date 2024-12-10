module Compiler.Lexer where
import Data.Char

-- Sintax Abstract Tree 
data Expr = BTrue
          | BFalse
          | Num Int 
          | Add Expr Expr
          | Sub Expr Expr
          | Mul Expr Expr
          | And Expr Expr
          | Or Expr Expr
          | Eq Expr Expr
          | Gte Expr Expr
          | Not Expr
          | If Expr Expr Expr
          | Var String
          | Lam String Ty Expr
          | App Expr Expr
          | Par Expr
          | Lst [Expr]
          | LstCon Expr Expr
          | Head Expr
          | Tail Expr
          | IsNull Expr
          deriving (Show, Eq, Ord)


data Ty = TBool
        | TNum
        | TLst Ty
        | TFun Ty Ty
        deriving (Show, Eq, Ord)


data Token = TokenTrue
           | TokenFalse
           | TokenNum Int
           | TokenAdd
           | TokenSub
           | TokenMul
           | TokenAnd
           | TokenOr
           | TokenEq
           | TokenGte
           | TokenNot
           | TokenIf
           | TokenThen
           | TokenElse
           | TokenVar String 
           | TokenLam
           | TokenArrow
           | TokenPOpen
           | TokenPClose
           | TokenBOpen
           | TokenBClose
           | TokenDDots 
           | TokenTyNum 
           | TokenTyBool
           | TokenTyLst
           | TokenComma
           | TokenHead 
           | TokenTail 
           | TokenIsNull 
           deriving (Show, Eq)


lexer :: String -> [Token]
lexer []            = []
lexer ('+':cs)      = TokenAdd : lexer cs 
lexer ('-':'>':cs)  = TokenArrow : lexer cs 
lexer ('-':cs)      = TokenSub: lexer cs 
lexer ('*':cs)      = TokenMul : lexer cs
lexer ('=':'=':cs)  = TokenEq : lexer cs
lexer ('>':'=':cs)  = TokenGte : lexer cs 
lexer ('\\':cs)     = TokenLam : lexer cs 
lexer ('(':cs)      = TokenPOpen : lexer cs
lexer (')':cs)      = TokenPClose : lexer cs
lexer ('[':cs)      = TokenBOpen : lexer cs
lexer (']':cs)      = TokenBClose : lexer cs
lexer (':':cs)      = TokenDDots : lexer cs
lexer (',':cs)      = TokenComma : lexer cs
lexer (c:cs)
  | isSpace c = lexer cs -- ignores whitespace 
  | isAlpha c = lexerKW (c:cs) -- alphanumeric 
  | isDigit c = lexerNum (c:cs)  -- digits 

lexerNum :: String -> [Token]
lexerNum cs = case span isDigit cs of 
                (num, rest) -> TokenNum (read num) : lexer rest

lexerKW:: String -> [Token]
lexerKW cs = case span isAlpha cs of -- span recebe funcao que retorna bool
               ("true", rest)   -> TokenTrue  : lexer rest
               ("false", rest)  -> TokenFalse : lexer rest
               ("and", rest)    -> TokenAnd  : lexer rest
               ("or", rest)     -> TokenOr  : lexer rest
               ("not", rest)    -> TokenNot  : lexer rest
               ("if", rest)     -> TokenIf   : lexer rest
               ("then", rest)   -> TokenThen : lexer rest
               ("else", rest)   -> TokenElse : lexer rest
               ("Num", rest)    -> TokenTyNum : lexer rest
               ("Bool", rest)   -> TokenTyBool : lexer rest
               ("Lst", rest)   -> TokenTyLst : lexer rest
               ("null", rest)   -> TokenIsNull: lexer rest
               ("head", rest)   -> TokenHead: lexer rest
               ("tail", rest)   -> TokenTail : lexer rest
               (var, rest)      -> TokenVar var : lexer rest -- var: if the words is not reserved, it is a variable