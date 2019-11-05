%ASSIGNMENT 2, Task 2 and 3

%Lex returning Input - string as list of Lexemes
fun {Lex Input}
  %Divides the Input whenever a space occurs, and returns the previous string as elements of list
  {String.tokens Input & }
end

%Tokenize returns a list of records representing either numbers, operators or commands
fun {Tokenize Lexemes}
  %Recursive iteration, using the "new" head of "reduced" list for each iteration
  case Lexemes of H|T then
    %Return record operator(type:) if Lexeme is operator, else number()
    if H == "+" then
      operator(type:plus)|{Tokenize T}
    elseif H == "*" then
      operator(type:multiply)|{Tokenize T}
    elseif H == "-" then
      operator(type:minus)|{Tokenize T}
    elseif H == "/" then
      operator(type:divide)|{Tokenize T}
    elseif H == "p" then
      command(print)|{Tokenize T}
    elseif H == "d" then
      command(duplicatetop)|{Tokenize T}
    elseif H == "i" then
      command(fliptop)|{Tokenize T}
    elseif H == "^" then
      command(inverse)|{Tokenize T}
    else
      number({String.toFloat H})|{Tokenize T}
    end
  else
    nil
  end
end

%High level description of how the mdc works:
%Function Interpret calls function IteratePostfix with Tokens and an empty stack as arguments.
%IteratePostfix iterates the list of Tokens recursively, while actively checking whether the current element
%is either a number, an operator or a command.
%If it is a number, then push the number to the stack.
%If it is an operator, then perform the operation on the two values on top of the stack using
%function Operation, and add it to the stack where these two elements are now popped (dropped).
%Using pattern matching, the p, i, d and f commands are recognized and the top of the stack is
%modified (or the stack is printed in case p).
%When Tokens is empty (nil), the Stack is returned with its modifications.
fun {Interpret Tokens}
    {IteratePostfix Tokens nil}
end

%Iterates Tokens recursively and returns Stack with performed postfix operations at end of list
fun {IteratePostfix Tokens Stack}
  case Tokens of Head|Tail then
    %Adding pattern matching cases p, d, i and ^ (E.g. command(i) as Token)
    case Head of command(X) then
      %Print current stack when p occurs
      if X == print then
        {System.show {List.reverse Stack}}
        {IteratePostfix Tail Stack}
      %Duplicate top element of stack when d occurs
      elseif X == duplicatetop then
        {IteratePostfix Tail Stack.1 | Stack}
      %Flip sign of top of stack when i occurs
      elseif X == fliptop then
        {IteratePostfix Tail number(~1.0*Stack.1.1) | {Drop Stack 1}}
      %Take the multiplicative inverse of the top of the stack when ^ occurs (x ^ becomes 1/x in float)
      elseif X == inverse then
        {IteratePostfix Tail number(1.0/Stack.1.1) | {Drop Stack 1}}
      end
    else
      %If element of Tokens is an operator
      if {Label Head} == operator then
        %Perform this operation on two last elements in Stack and pop these previous numbers from Stack. Push result.
        {IteratePostfix Tail {Operation Stack.1 Stack.2.1 Head} | {Drop Stack 2}}
      %If element of Tokens is a number
      elseif {Label Head} == number then
        %Push this number to Stack
        {IteratePostfix Tail (Head|Stack)}
      else
        %Remove element that belongs to pattern matching e.g. and continue iterating recursively
        {Drop Stack 1}
      end
    end
  else
    %Reverse the Stack to print in correct order
    {List.reverse Stack}
  end
end

%Applying operation Operand on B and A respectively
fun {Operation A B Operand}
  %Matching the type of the record Operand with operators and calculating
  if Operand.type == multiply then
    number(B.1*A.1)
  elseif Operand.type == plus then
    number(B.1+A.1)
  elseif Operand.type == divide then
    number(B.1/A.1)
  elseif Operand.type == minus then
    number(B.1-A.1)
  else
    0
  end
end

%High level description of converting postfix notation to infix notation:
%Instead of calculating the postfix operation of the two most recent elements in stack (using function Operation),
%the expression is returned/pushed to stack as a string.
%Example: Instead of calculating and returning 1+2, I make a string using: {VirtualString.toAtom "(" # 1 #"+" #2 #")"},
%which returns "(1+2)" instead of 3.
fun {Infix Tokens}
  {InfixInternal Tokens nil}
end

%Function returns ExpressionStack, the stack of which the infix notation of postfix operation is presented
fun {InfixInternal Tokens ExpressionStack}
  case Tokens of Head|Tail then
      %If element of Tokens is an operator
      if {Label Head} == operator then
        %Perform this operation on two last elements in Stack and pop these previous numbers from Stack. Push result.
        {InfixInternal Tail {InfixOperation ExpressionStack.1 ExpressionStack.2.1 Head} | {Drop ExpressionStack 2}}
      %If element of Tokens is a number
      elseif {Label Head} == number then
        %Push this number to Stack
        {InfixInternal Tail (Head.1|ExpressionStack)}
      end
  else
    %Reverse the Stack to print in correct order
    {List.reverse ExpressionStack}
  end
end

%Function returns a string the represent the infix notation of the given postfix operation for respectively B and A
fun {InfixOperation A B Operand}
  %Matching the type of the record Operand with operators and calculating
  if Operand.type == multiply then
    {VirtualString.toAtom "(" # B #"*" #A #")"}
  elseif Operand.type == plus then
    {VirtualString.toAtom "(" # B #"+" #A #")"}
  elseif Operand.type == divide then
    {VirtualString.toAtom "(" # B #"/" #A #")"}
  elseif Operand.type == minus then
    {VirtualString.toAtom "(" # B #"-" #A #")"}
  else
    0
  end
end
