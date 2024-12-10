{-# OPTIONS_GHC -w #-}
module Compiler.Parser where 

import Compiler.Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,308) ([33728,708,1031,0,0,0,0,32764,28844,0,0,0,0,0,0,0,18492,28716,33728,708,7,2048,49152,50307,1794,18492,28716,33728,708,15367,11336,49264,50307,1794,16320,128,64512,2051,49152,32831,49152,51199,1818,0,64,65472,3015,8199,0,49152,53247,1802,14272,128,0,0,15360,11336,49264,50307,1794,18492,28716,33728,708,15367,11336,49264,50307,1794,18492,28716,33728,708,49159,32775,0,124,8,1984,128,4096,0,0,1,0,0,0,256,0,4096,0,15360,11336,112,0,8,0,0,0,0,15360,11336,112,0,0,0,3592,65472,2775,15367,11336,112,8192,0,0,3592,0,0,0,0,0,32768,224,0,0,0,32,15360,11336,49264,50175,1802,32764,28860,0,57472,0,4096,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Exp","LExp","Type","true","false","num","var","'+'","'-'","'*'","and","or","not","\"==\"","\">=\"","if","then","else","\"->\"","'\\\\'","'('","')'","'['","']'","':'","','","Num","Bool","Lst","null","head","tail","%eof"]
        bit_start = st Prelude.* 36
        bit_end = (st Prelude.+ 1) Prelude.* 36
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..35]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (7) = happyShift action_2
action_0 (8) = happyShift action_4
action_0 (9) = happyShift action_5
action_0 (10) = happyShift action_6
action_0 (16) = happyShift action_7
action_0 (19) = happyShift action_8
action_0 (23) = happyShift action_9
action_0 (24) = happyShift action_10
action_0 (26) = happyShift action_11
action_0 (33) = happyShift action_12
action_0 (34) = happyShift action_13
action_0 (35) = happyShift action_14
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (7) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (7) = happyShift action_2
action_3 (8) = happyShift action_4
action_3 (9) = happyShift action_5
action_3 (10) = happyShift action_6
action_3 (11) = happyShift action_25
action_3 (12) = happyShift action_26
action_3 (13) = happyShift action_27
action_3 (14) = happyShift action_28
action_3 (15) = happyShift action_29
action_3 (16) = happyShift action_7
action_3 (17) = happyShift action_30
action_3 (18) = happyShift action_31
action_3 (19) = happyShift action_8
action_3 (23) = happyShift action_9
action_3 (24) = happyShift action_10
action_3 (26) = happyShift action_11
action_3 (28) = happyShift action_32
action_3 (33) = happyShift action_12
action_3 (34) = happyShift action_13
action_3 (35) = happyShift action_14
action_3 (36) = happyAccept
action_3 (4) = happyGoto action_24
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_2

action_5 _ = happyReduce_3

action_6 _ = happyReduce_4

action_7 (7) = happyShift action_2
action_7 (8) = happyShift action_4
action_7 (9) = happyShift action_5
action_7 (10) = happyShift action_6
action_7 (16) = happyShift action_7
action_7 (19) = happyShift action_8
action_7 (23) = happyShift action_9
action_7 (24) = happyShift action_10
action_7 (26) = happyShift action_11
action_7 (33) = happyShift action_12
action_7 (34) = happyShift action_13
action_7 (35) = happyShift action_14
action_7 (4) = happyGoto action_23
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (7) = happyShift action_2
action_8 (8) = happyShift action_4
action_8 (9) = happyShift action_5
action_8 (10) = happyShift action_6
action_8 (16) = happyShift action_7
action_8 (19) = happyShift action_8
action_8 (23) = happyShift action_9
action_8 (24) = happyShift action_10
action_8 (26) = happyShift action_11
action_8 (33) = happyShift action_12
action_8 (34) = happyShift action_13
action_8 (35) = happyShift action_14
action_8 (4) = happyGoto action_22
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (24) = happyShift action_21
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (7) = happyShift action_2
action_10 (8) = happyShift action_4
action_10 (9) = happyShift action_5
action_10 (10) = happyShift action_6
action_10 (16) = happyShift action_7
action_10 (19) = happyShift action_8
action_10 (23) = happyShift action_9
action_10 (24) = happyShift action_10
action_10 (26) = happyShift action_11
action_10 (33) = happyShift action_12
action_10 (34) = happyShift action_13
action_10 (35) = happyShift action_14
action_10 (4) = happyGoto action_20
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (7) = happyShift action_2
action_11 (8) = happyShift action_4
action_11 (9) = happyShift action_5
action_11 (10) = happyShift action_6
action_11 (16) = happyShift action_7
action_11 (19) = happyShift action_8
action_11 (23) = happyShift action_9
action_11 (24) = happyShift action_10
action_11 (26) = happyShift action_11
action_11 (33) = happyShift action_12
action_11 (34) = happyShift action_13
action_11 (35) = happyShift action_14
action_11 (4) = happyGoto action_18
action_11 (5) = happyGoto action_19
action_11 _ = happyReduce_22

action_12 (7) = happyShift action_2
action_12 (8) = happyShift action_4
action_12 (9) = happyShift action_5
action_12 (10) = happyShift action_6
action_12 (16) = happyShift action_7
action_12 (19) = happyShift action_8
action_12 (23) = happyShift action_9
action_12 (24) = happyShift action_10
action_12 (26) = happyShift action_11
action_12 (33) = happyShift action_12
action_12 (34) = happyShift action_13
action_12 (35) = happyShift action_14
action_12 (4) = happyGoto action_17
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (7) = happyShift action_2
action_13 (8) = happyShift action_4
action_13 (9) = happyShift action_5
action_13 (10) = happyShift action_6
action_13 (16) = happyShift action_7
action_13 (19) = happyShift action_8
action_13 (23) = happyShift action_9
action_13 (24) = happyShift action_10
action_13 (26) = happyShift action_11
action_13 (33) = happyShift action_12
action_13 (34) = happyShift action_13
action_13 (35) = happyShift action_14
action_13 (4) = happyGoto action_16
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (7) = happyShift action_2
action_14 (8) = happyShift action_4
action_14 (9) = happyShift action_5
action_14 (10) = happyShift action_6
action_14 (16) = happyShift action_7
action_14 (19) = happyShift action_8
action_14 (23) = happyShift action_9
action_14 (24) = happyShift action_10
action_14 (26) = happyShift action_11
action_14 (33) = happyShift action_12
action_14 (34) = happyShift action_13
action_14 (35) = happyShift action_14
action_14 (4) = happyGoto action_15
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (11) = happyShift action_25
action_15 (12) = happyShift action_26
action_15 (13) = happyShift action_27
action_15 (14) = happyShift action_28
action_15 (15) = happyShift action_29
action_15 (16) = happyShift action_7
action_15 (17) = happyShift action_30
action_15 (18) = happyShift action_31
action_15 (28) = happyShift action_32
action_15 (33) = happyFail []
action_15 (34) = happyFail []
action_15 (35) = happyFail []
action_15 (4) = happyGoto action_24
action_15 _ = happyReduce_21

action_16 (11) = happyShift action_25
action_16 (12) = happyShift action_26
action_16 (13) = happyShift action_27
action_16 (14) = happyShift action_28
action_16 (15) = happyShift action_29
action_16 (16) = happyShift action_7
action_16 (17) = happyShift action_30
action_16 (18) = happyShift action_31
action_16 (28) = happyShift action_32
action_16 (33) = happyFail []
action_16 (34) = happyFail []
action_16 (35) = happyFail []
action_16 (4) = happyGoto action_24
action_16 _ = happyReduce_20

action_17 (11) = happyShift action_25
action_17 (12) = happyShift action_26
action_17 (13) = happyShift action_27
action_17 (14) = happyShift action_28
action_17 (15) = happyShift action_29
action_17 (16) = happyShift action_7
action_17 (17) = happyShift action_30
action_17 (18) = happyShift action_31
action_17 (28) = happyShift action_32
action_17 (33) = happyFail []
action_17 (34) = happyFail []
action_17 (35) = happyFail []
action_17 (4) = happyGoto action_24
action_17 _ = happyReduce_19

action_18 (7) = happyShift action_2
action_18 (8) = happyShift action_4
action_18 (9) = happyShift action_5
action_18 (10) = happyShift action_6
action_18 (11) = happyShift action_25
action_18 (12) = happyShift action_26
action_18 (13) = happyShift action_27
action_18 (14) = happyShift action_28
action_18 (15) = happyShift action_29
action_18 (16) = happyShift action_7
action_18 (17) = happyShift action_30
action_18 (18) = happyShift action_31
action_18 (19) = happyShift action_8
action_18 (23) = happyShift action_9
action_18 (24) = happyShift action_10
action_18 (26) = happyShift action_11
action_18 (28) = happyShift action_32
action_18 (29) = happyShift action_45
action_18 (33) = happyShift action_12
action_18 (34) = happyShift action_13
action_18 (35) = happyShift action_14
action_18 (4) = happyGoto action_24
action_18 _ = happyReduce_23

action_19 (27) = happyShift action_44
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (7) = happyShift action_2
action_20 (8) = happyShift action_4
action_20 (9) = happyShift action_5
action_20 (10) = happyShift action_6
action_20 (11) = happyShift action_25
action_20 (12) = happyShift action_26
action_20 (13) = happyShift action_27
action_20 (14) = happyShift action_28
action_20 (15) = happyShift action_29
action_20 (16) = happyShift action_7
action_20 (17) = happyShift action_30
action_20 (18) = happyShift action_31
action_20 (19) = happyShift action_8
action_20 (23) = happyShift action_9
action_20 (24) = happyShift action_10
action_20 (25) = happyShift action_43
action_20 (26) = happyShift action_11
action_20 (28) = happyShift action_32
action_20 (33) = happyShift action_12
action_20 (34) = happyShift action_13
action_20 (35) = happyShift action_14
action_20 (4) = happyGoto action_24
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (10) = happyShift action_42
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (7) = happyShift action_2
action_22 (8) = happyShift action_4
action_22 (9) = happyShift action_5
action_22 (10) = happyShift action_6
action_22 (11) = happyShift action_25
action_22 (12) = happyShift action_26
action_22 (13) = happyShift action_27
action_22 (14) = happyShift action_28
action_22 (15) = happyShift action_29
action_22 (16) = happyShift action_7
action_22 (17) = happyShift action_30
action_22 (18) = happyShift action_31
action_22 (19) = happyShift action_8
action_22 (20) = happyShift action_41
action_22 (23) = happyShift action_9
action_22 (24) = happyShift action_10
action_22 (26) = happyShift action_11
action_22 (28) = happyShift action_32
action_22 (33) = happyShift action_12
action_22 (34) = happyShift action_13
action_22 (35) = happyShift action_14
action_22 (4) = happyGoto action_24
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (11) = happyShift action_25
action_23 (12) = happyShift action_26
action_23 (13) = happyShift action_27
action_23 (14) = happyShift action_28
action_23 (15) = happyShift action_29
action_23 (17) = happyShift action_30
action_23 (18) = happyShift action_31
action_23 (28) = happyShift action_32
action_23 (4) = happyGoto action_24
action_23 _ = happyReduce_10

action_24 (7) = happyShift action_2
action_24 (8) = happyShift action_4
action_24 (9) = happyShift action_5
action_24 (10) = happyShift action_6
action_24 (11) = happyShift action_25
action_24 (12) = happyShift action_26
action_24 (13) = happyShift action_27
action_24 (14) = happyShift action_28
action_24 (15) = happyShift action_29
action_24 (16) = happyShift action_7
action_24 (17) = happyShift action_30
action_24 (18) = happyShift action_31
action_24 (19) = happyShift action_8
action_24 (23) = happyShift action_9
action_24 (24) = happyShift action_10
action_24 (26) = happyShift action_11
action_24 (28) = happyShift action_32
action_24 (33) = happyShift action_12
action_24 (34) = happyShift action_13
action_24 (35) = happyShift action_14
action_24 (4) = happyGoto action_24
action_24 _ = happyReduce_16

action_25 (7) = happyShift action_2
action_25 (8) = happyShift action_4
action_25 (9) = happyShift action_5
action_25 (10) = happyShift action_6
action_25 (16) = happyShift action_7
action_25 (19) = happyShift action_8
action_25 (23) = happyShift action_9
action_25 (24) = happyShift action_10
action_25 (26) = happyShift action_11
action_25 (33) = happyShift action_12
action_25 (34) = happyShift action_13
action_25 (35) = happyShift action_14
action_25 (4) = happyGoto action_40
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (7) = happyShift action_2
action_26 (8) = happyShift action_4
action_26 (9) = happyShift action_5
action_26 (10) = happyShift action_6
action_26 (16) = happyShift action_7
action_26 (19) = happyShift action_8
action_26 (23) = happyShift action_9
action_26 (24) = happyShift action_10
action_26 (26) = happyShift action_11
action_26 (33) = happyShift action_12
action_26 (34) = happyShift action_13
action_26 (35) = happyShift action_14
action_26 (4) = happyGoto action_39
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (7) = happyShift action_2
action_27 (8) = happyShift action_4
action_27 (9) = happyShift action_5
action_27 (10) = happyShift action_6
action_27 (16) = happyShift action_7
action_27 (19) = happyShift action_8
action_27 (23) = happyShift action_9
action_27 (24) = happyShift action_10
action_27 (26) = happyShift action_11
action_27 (33) = happyShift action_12
action_27 (34) = happyShift action_13
action_27 (35) = happyShift action_14
action_27 (4) = happyGoto action_38
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (7) = happyShift action_2
action_28 (8) = happyShift action_4
action_28 (9) = happyShift action_5
action_28 (10) = happyShift action_6
action_28 (16) = happyShift action_7
action_28 (19) = happyShift action_8
action_28 (23) = happyShift action_9
action_28 (24) = happyShift action_10
action_28 (26) = happyShift action_11
action_28 (33) = happyShift action_12
action_28 (34) = happyShift action_13
action_28 (35) = happyShift action_14
action_28 (4) = happyGoto action_37
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (7) = happyShift action_2
action_29 (8) = happyShift action_4
action_29 (9) = happyShift action_5
action_29 (10) = happyShift action_6
action_29 (16) = happyShift action_7
action_29 (19) = happyShift action_8
action_29 (23) = happyShift action_9
action_29 (24) = happyShift action_10
action_29 (26) = happyShift action_11
action_29 (33) = happyShift action_12
action_29 (34) = happyShift action_13
action_29 (35) = happyShift action_14
action_29 (4) = happyGoto action_36
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (7) = happyShift action_2
action_30 (8) = happyShift action_4
action_30 (9) = happyShift action_5
action_30 (10) = happyShift action_6
action_30 (16) = happyShift action_7
action_30 (19) = happyShift action_8
action_30 (23) = happyShift action_9
action_30 (24) = happyShift action_10
action_30 (26) = happyShift action_11
action_30 (33) = happyShift action_12
action_30 (34) = happyShift action_13
action_30 (35) = happyShift action_14
action_30 (4) = happyGoto action_35
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (7) = happyShift action_2
action_31 (8) = happyShift action_4
action_31 (9) = happyShift action_5
action_31 (10) = happyShift action_6
action_31 (16) = happyShift action_7
action_31 (19) = happyShift action_8
action_31 (23) = happyShift action_9
action_31 (24) = happyShift action_10
action_31 (26) = happyShift action_11
action_31 (33) = happyShift action_12
action_31 (34) = happyShift action_13
action_31 (35) = happyShift action_14
action_31 (4) = happyGoto action_34
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (7) = happyShift action_2
action_32 (8) = happyShift action_4
action_32 (9) = happyShift action_5
action_32 (10) = happyShift action_6
action_32 (16) = happyShift action_7
action_32 (19) = happyShift action_8
action_32 (23) = happyShift action_9
action_32 (24) = happyShift action_10
action_32 (26) = happyShift action_11
action_32 (33) = happyShift action_12
action_32 (34) = happyShift action_13
action_32 (35) = happyShift action_14
action_32 (4) = happyGoto action_33
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (11) = happyShift action_25
action_33 (12) = happyShift action_26
action_33 (13) = happyShift action_27
action_33 (14) = happyShift action_28
action_33 (15) = happyShift action_29
action_33 (28) = happyShift action_32
action_33 (4) = happyGoto action_24
action_33 _ = happyReduce_18

action_34 (11) = happyShift action_25
action_34 (12) = happyShift action_26
action_34 (13) = happyShift action_27
action_34 (14) = happyShift action_28
action_34 (15) = happyShift action_29
action_34 (28) = happyShift action_32
action_34 (4) = happyGoto action_24
action_34 _ = happyReduce_12

action_35 (11) = happyShift action_25
action_35 (12) = happyShift action_26
action_35 (13) = happyShift action_27
action_35 (14) = happyShift action_28
action_35 (15) = happyShift action_29
action_35 (28) = happyShift action_32
action_35 (4) = happyGoto action_24
action_35 _ = happyReduce_11

action_36 (13) = happyShift action_27
action_36 (4) = happyGoto action_24
action_36 _ = happyReduce_9

action_37 (13) = happyShift action_27
action_37 (4) = happyGoto action_24
action_37 _ = happyReduce_8

action_38 (4) = happyGoto action_24
action_38 _ = happyReduce_7

action_39 (13) = happyShift action_27
action_39 (4) = happyGoto action_24
action_39 _ = happyReduce_6

action_40 (13) = happyShift action_27
action_40 (4) = happyGoto action_24
action_40 _ = happyReduce_5

action_41 (7) = happyShift action_2
action_41 (8) = happyShift action_4
action_41 (9) = happyShift action_5
action_41 (10) = happyShift action_6
action_41 (16) = happyShift action_7
action_41 (19) = happyShift action_8
action_41 (23) = happyShift action_9
action_41 (24) = happyShift action_10
action_41 (26) = happyShift action_11
action_41 (33) = happyShift action_12
action_41 (34) = happyShift action_13
action_41 (35) = happyShift action_14
action_41 (4) = happyGoto action_48
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (28) = happyShift action_47
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_13

action_44 _ = happyReduce_17

action_45 (7) = happyShift action_2
action_45 (8) = happyShift action_4
action_45 (9) = happyShift action_5
action_45 (10) = happyShift action_6
action_45 (16) = happyShift action_7
action_45 (19) = happyShift action_8
action_45 (23) = happyShift action_9
action_45 (24) = happyShift action_10
action_45 (26) = happyShift action_11
action_45 (33) = happyShift action_12
action_45 (34) = happyShift action_13
action_45 (35) = happyShift action_14
action_45 (4) = happyGoto action_18
action_45 (5) = happyGoto action_46
action_45 _ = happyReduce_22

action_46 _ = happyReduce_24

action_47 (24) = happyShift action_51
action_47 (30) = happyShift action_52
action_47 (31) = happyShift action_53
action_47 (32) = happyShift action_54
action_47 (6) = happyGoto action_50
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (7) = happyShift action_2
action_48 (8) = happyShift action_4
action_48 (9) = happyShift action_5
action_48 (10) = happyShift action_6
action_48 (11) = happyShift action_25
action_48 (12) = happyShift action_26
action_48 (13) = happyShift action_27
action_48 (14) = happyShift action_28
action_48 (15) = happyShift action_29
action_48 (16) = happyShift action_7
action_48 (17) = happyShift action_30
action_48 (18) = happyShift action_31
action_48 (19) = happyShift action_8
action_48 (21) = happyShift action_49
action_48 (23) = happyShift action_9
action_48 (24) = happyShift action_10
action_48 (26) = happyShift action_11
action_48 (28) = happyShift action_32
action_48 (33) = happyShift action_12
action_48 (34) = happyShift action_13
action_48 (35) = happyShift action_14
action_48 (4) = happyGoto action_24
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (7) = happyShift action_2
action_49 (8) = happyShift action_4
action_49 (9) = happyShift action_5
action_49 (10) = happyShift action_6
action_49 (16) = happyShift action_7
action_49 (19) = happyShift action_8
action_49 (23) = happyShift action_9
action_49 (24) = happyShift action_10
action_49 (26) = happyShift action_11
action_49 (33) = happyShift action_12
action_49 (34) = happyShift action_13
action_49 (35) = happyShift action_14
action_49 (4) = happyGoto action_58
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (22) = happyShift action_57
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (24) = happyShift action_51
action_51 (30) = happyShift action_52
action_51 (31) = happyShift action_53
action_51 (32) = happyShift action_54
action_51 (6) = happyGoto action_56
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_25

action_53 _ = happyReduce_26

action_54 (24) = happyShift action_51
action_54 (30) = happyShift action_52
action_54 (31) = happyShift action_53
action_54 (32) = happyShift action_54
action_54 (6) = happyGoto action_55
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_27

action_56 (22) = happyShift action_60
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (7) = happyShift action_2
action_57 (8) = happyShift action_4
action_57 (9) = happyShift action_5
action_57 (10) = happyShift action_6
action_57 (16) = happyShift action_7
action_57 (19) = happyShift action_8
action_57 (23) = happyShift action_9
action_57 (24) = happyShift action_10
action_57 (26) = happyShift action_11
action_57 (33) = happyShift action_12
action_57 (34) = happyShift action_13
action_57 (35) = happyShift action_14
action_57 (4) = happyGoto action_59
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (7) = happyShift action_2
action_58 (8) = happyShift action_4
action_58 (9) = happyShift action_5
action_58 (10) = happyShift action_6
action_58 (11) = happyShift action_25
action_58 (12) = happyShift action_26
action_58 (13) = happyShift action_27
action_58 (14) = happyShift action_28
action_58 (15) = happyShift action_29
action_58 (16) = happyShift action_7
action_58 (17) = happyShift action_30
action_58 (18) = happyShift action_31
action_58 (19) = happyFail []
action_58 (23) = happyShift action_9
action_58 (24) = happyShift action_10
action_58 (26) = happyShift action_11
action_58 (28) = happyShift action_32
action_58 (33) = happyShift action_12
action_58 (34) = happyShift action_13
action_58 (35) = happyShift action_14
action_58 (4) = happyGoto action_24
action_58 _ = happyReduce_14

action_59 (7) = happyShift action_2
action_59 (8) = happyShift action_4
action_59 (9) = happyShift action_5
action_59 (10) = happyShift action_6
action_59 (11) = happyShift action_25
action_59 (12) = happyShift action_26
action_59 (13) = happyShift action_27
action_59 (14) = happyShift action_28
action_59 (15) = happyShift action_29
action_59 (16) = happyShift action_7
action_59 (17) = happyShift action_30
action_59 (18) = happyShift action_31
action_59 (19) = happyShift action_8
action_59 (23) = happyShift action_9
action_59 (24) = happyShift action_10
action_59 (25) = happyShift action_62
action_59 (26) = happyShift action_11
action_59 (28) = happyShift action_32
action_59 (33) = happyShift action_12
action_59 (34) = happyShift action_13
action_59 (35) = happyShift action_14
action_59 (4) = happyGoto action_24
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (24) = happyShift action_51
action_60 (30) = happyShift action_52
action_60 (31) = happyShift action_53
action_60 (32) = happyShift action_54
action_60 (6) = happyGoto action_61
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (25) = happyShift action_63
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_15

action_63 _ = happyReduce_28

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 _
	 =  HappyAbsSyn4
		 (BTrue
	)

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 _
	 =  HappyAbsSyn4
		 (BFalse
	)

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 (HappyTerminal (TokenNum happy_var_1))
	 =  HappyAbsSyn4
		 (Num happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  4 happyReduction_4
happyReduction_4 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn4
		 (Var happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Add happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  4 happyReduction_7
happyReduction_7 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (And happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  4 happyReduction_9
happyReduction_9 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Or happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Not happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Eq happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  4 happyReduction_12
happyReduction_12 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Gte happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  4 happyReduction_13
happyReduction_13 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Par happy_var_2
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happyReduce 6 4 happyReduction_14
happyReduction_14 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 8 4 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lam happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_2  4 happyReduction_16
happyReduction_16 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (App happy_var_1 happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  4 happyReduction_17
happyReduction_17 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Lst happy_var_2
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  4 happyReduction_18
happyReduction_18 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (LstCon happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  4 happyReduction_19
happyReduction_19 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (IsNull happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  4 happyReduction_20
happyReduction_20 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Head happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  4 happyReduction_21
happyReduction_21 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Tail happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_0  5 happyReduction_22
happyReduction_22  =  HappyAbsSyn5
		 ([]
	)

happyReduce_23 = happySpecReduce_1  5 happyReduction_23
happyReduction_23 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  5 happyReduction_24
happyReduction_24 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 : happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  6 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn6
		 (TNum
	)

happyReduce_26 = happySpecReduce_1  6 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn6
		 (TBool
	)

happyReduce_27 = happySpecReduce_2  6 happyReduction_27
happyReduction_27 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (TLst happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happyReduce 5 6 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (TFun happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 36 36 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenTrue -> cont 7;
	TokenFalse -> cont 8;
	TokenNum happy_dollar_dollar -> cont 9;
	TokenVar happy_dollar_dollar -> cont 10;
	TokenAdd -> cont 11;
	TokenSub -> cont 12;
	TokenMul -> cont 13;
	TokenAnd -> cont 14;
	TokenOr -> cont 15;
	TokenNot -> cont 16;
	TokenEq -> cont 17;
	TokenGte -> cont 18;
	TokenIf -> cont 19;
	TokenThen -> cont 20;
	TokenElse -> cont 21;
	TokenArrow -> cont 22;
	TokenLam -> cont 23;
	TokenPOpen -> cont 24;
	TokenPClose -> cont 25;
	TokenBOpen -> cont 26;
	TokenBClose -> cont 27;
	TokenDDots -> cont 28;
	TokenComma -> cont 29;
	TokenTyNum -> cont 30;
	TokenTyBool -> cont 31;
	TokenTyLst -> cont 32;
	TokenIsNull -> cont 33;
	TokenHead -> cont 34;
	TokenTail -> cont 35;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 36 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError ts = error "Syntax error: sequência de instruções inválidas"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
