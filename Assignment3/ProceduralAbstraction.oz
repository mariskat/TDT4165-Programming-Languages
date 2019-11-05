%ASSIGNMENT 3

%Task 1
%a)
%Binds RealSol = true if it has a real solution, and bind X1 and X2 to the corresponding real solutions
%REMARK: I think it was an error in the appendix? The determinant is sqrt(b^2-4ac) not sqrt(b^2-4bc). I used the first option anyway.
proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}
  %For it to be a real solution, what is inside the square root has to be > 0.
  if B*B-(4.0*A*C) >= 0.0 then
    X1 = (~B + {Sqrt (B*B)-(4.0*A*C)})/(2.0*A)
    X2 = (~B - {Sqrt (B*B)-(4.0*A*C)})/(2.0*A)
    RealSol = true
  else
    RealSol = false
  end
end

/*
b) Why are procedural abstractions useful?

Procedural abstraction is the ability in which a statement can be converted into a procedure value.
Creating a procedure with a statement makes it possible to create a procedure value instead of
executing the statement itself.
This means that the statement can be executed anywhere in the program, instead of where it is defined.
Procedural abstraction therefore makes it possible to delay the execution of a statement.
Also, a procedural value can have arguments, which makes it possible to retrieve values in the call and use
them in the statement execution.

%c) What is the difference between a procedure and a function?

Both procedures and functions are ways to express the computations as a unit in Oz. However, a function will in every
case return exactly one value, while a procedure dont necessarily return anything.

*/
