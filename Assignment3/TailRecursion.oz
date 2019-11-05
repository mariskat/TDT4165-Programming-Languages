/*
ASSIGNMENT 3
TASK 6

a) Is your Sum function from Task 2 tail recursive? If yes, explain why. If not, implement a tail recursive
   version and explain how your changes made it so.

A function that has only one recursive call that is the last call in the functionbody is tail-recursive.
Therefore, the Sum-implementation is tail recursive.

b) What is the benefit of tail recursion in Oz?

In Oz, there are single-assignment variables. It is possible to avoid reading an incomplete value while
building. Konstant stack-størrelse ved halerekursjon vs at den øker lineært med antall kall ellers.


c) Do all programming languages that allow recursion benefit from tail recursion? Why/why not?

No, not every language, but every functional programming language should!
In imperative programming, it is not necessary to loop and return the function call value itself
as last value. But in functional languages, it is important to support tail-recursion.

*/
