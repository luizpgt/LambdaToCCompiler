module Main where 

import Compiler.Lexer 
import Compiler.Parser
import Compiler.TypeChecker
import Compiler.Compiler

-- iterative usage 
-- typecheck $ parser $ lexer "2+2"

-- non iterative usage 
-- runghc Main.hs < ./Examples/code.abp

main :: IO ()
main = do
    input' <- getContents                                           -- read input 
    let input = rmComm input'                                       -- remove comments 
    let program = typecheck . parser . lexer $ input
    let (funcs, calls) = compiler program                           -- get functions + main() content
    let (icCall, varName, formatSpec)= callCode calls (typeof [] program) -- gather additional code info 
    writeFile "main.c" (cProg funcs calls icCall varName formatSpec)
    putStrLn "Compilation result written to main.c"


-- assemble c source code
cProg :: String -> String -> String -> String -> String -> String 
cProg funcs calls icCall varName formatSpec = "#include <stdio.h>\n#define true 1\n#define false 0\ntypedef short bool;\n\n" ++
                    funcs ++ 
                    "\n\nint main() {" ++
                    "\n\t" ++ icCall ++ 
                    "\n\tprintf(\""++ formatSpec ++ "\\n\", "++ varName ++ ");" ++ 
                    "\n\treturn 0;\n}"


-- remove comments from original source code
rmComm :: String -> String
rmComm [] = []
rmComm ('-':'-':xs) = case dropWhile (/= '\n') xs of  
                             [] -> []
                             (_:rest) -> rmComm rest
rmComm(x:xs) = x : rmComm xs