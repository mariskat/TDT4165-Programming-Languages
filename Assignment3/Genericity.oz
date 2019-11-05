%ASSIGNMENT 3

%TASK 2
%Function returning sum of elements in list
fun {Sum List}
  case List of Head|Tail then
    Head+{Sum Tail}
  else
    0
  end
end

%TASK 3

%a), b)
%Performing operation Op on each element of List until reduced to U
fun {RightFold List Op U}
  case List of Head|Tail then %Pattern matching the list for Head-Tail pattern
    {Op Head {RightFold Tail Op U}} %Calls function Op, which is defined as argument in RightFold.
                                    %The arguments of Op is each element in list and the reduced list respectively.
                                    %Op performs the function-specified operation with the two arguments.
  else %If the list is at its end (no more head-tail pattern)
    U %U is returned - it is set as argument when RightFold is called. This is because in e.g. addition, U = 0 will give the
      %most reduced value X+0=X while in e.g. multiplication X*0=0, while we want X*1=X. Makes it possible to use RightFold as
      %general case
  end
end

%c)
%Sum of list using RightFold
fun {RightFoldSum List}
  {RightFold List fun {$ X Y} X+Y end 0}
end

%Length of list using RightFold
fun {RightFoldLength List}
  {RightFold List fun {$ X Y} 1+Y  end 0}
end


/*
d) For the Sum and length operations, would left fold (a left-associative fold) and right fold give different results?
   What about subtraction?

In the Sum and Length operations, each element is added to each other (or the return value is incremented for each element).
When adding, the direction of operations do not matter, because e.g. 1+3 = 4 while 3+1=4 as well. A left-fold would therefore
give the same results for Sum and Length.
For subtraction, however, the direction of computation does matter, e.g. 3-1 = 2 while 1-3 = -2, and left-fold would
give different results than the right-fold.

e) What is a good value for U when using RightFold to implement the product of list element?

When using RightFold to implement the product of the list, the reduced list should be 1
so that the product X will be multiplied with 1 and not 0. Multiplication X*0=0, while we want X*1=X.
U should therefore be = 1.


*/
