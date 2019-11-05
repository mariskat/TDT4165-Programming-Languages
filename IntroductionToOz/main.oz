%Main function including examplecode to run.
%Task 1 function is in List.oz and task 2 and 3 is in mdc.oz which is inserted.
%High level description of postfix and infix functions are written above these functions in mdc.oz.

functor
import
  System
define
  \insert List.oz
  \insert mdc.oz

%TASK 1: List
  %{System.show {Length [1 2 3 4]}}
  %{System.show {Take [1 2 3 4] 3}}
  %{System.show {Drop [1 2 3 4] 2}}
  %{System.show {Append [1 2 3 4] [5 6 7]}}
  %{System.show {Member [1 2 3 4] 3}}
  %{System.show {Position [1 2 3 4] 3}}

%TASK 2: mdc
  %Lex function
  %{System.show {Lex "1 2 + 3 *"}}

  %Tokenize function
  %{System.show {Tokenize ["1" "2" "+" "3" "*"]}}

  %Interpret functions with matching patterns
  %{System.show {Interpret {Tokenize {Lex "1 2 3 +"}}}}
  %{System.show {Interpret {Tokenize {Lex "1 2 3 + d"}}}}
  %{System.show {Interpret {Tokenize {Lex "1 2 3 p +"}}}}
  %{System.show {Interpret {Tokenize {Lex "1 2 3 i"}}}}
  %{System.show {Interpret {Tokenize {Lex "1 2 3 ^"}}}}

%TASK 3: Convert postfix notation to infix notation
  %Infix function for infix notation of postfix operation
  %{System.show {Infix {Tokenize {Lex "3.0 10.0 9.0 * - 0.3 +"}}}}
end

/*TASK 4 - THEORY

a)
Formal grammer of Lexemes:
We present a grammar G with Non-Terminal symbols Ns = {S, N, O, C},
Terminal symbols T = {+, -, *, /, p, i, d, f, <All numbers>}
With S as the starting symbol, we have the following production rules:
S -> N N O
S -> N C N O

     N -> <All numbers>
     N -> N N

     O -> O O
     O -> O N
     O -> N O
     O -> C
     O -> +
     O -> -
     O -> *
     O -> /

     C -> N
     C -> p
     C -> i
     C -> d
     C -> f

b) Describing with EBNF notation makes sure that the terminal symbols and nonterminal symbols, Tokens, are distinguished.
   digit = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" ;
   symbol = "(" | ")" | "+" | "-" | "/" | "*" | "p" | "i" | "f" | "d" ;
   character = digit | symbol ;

c) A context-free grammar is a grammar where all production rules go from one non-terminal to a
  string of terminals and non-terminal. E.g. S -> y where y is a string comprised og terminals/non-terminals.
  Context-sensitive grammar on the other hand has the possibility of having terminals/non-terminals go to another
  terminal/non-terminal, e.g. Sy -> xy.

d) The float-int error occurs because an int (1) and a float(1.0) does not have the same precision - a float is
   always a fraction while an int is a exact number. It is useful because the interpreter makes the programmer
   take a concious choice on whether to use unlimited precision ints or limited precision floats. Making the choice
   of using floats, the programmer should be aware of the "danger" that follows; rounding errors, etc.













*/
