%ASSIGNMENT 4, Streams and threads


%TASK 1
%Generates a stream og odd numbers between S and E in ascending order
fun {GenerateOdd S E}
  if S>=E then %If current odd number is equal to or larger than end-value
    nil
  else
    if (S-2*(S div 2)) == 0 then %Square number if modulo of S and 2 is 0.
      S+1|{GenerateOdd S+1 E} %Add next odd number to list and make a recursive call with an odd number as S
    else
      S|{GenerateOdd S+2 E} %Odd number if modulo is not zero. Add to list and increment by 2
    end
  end
end

%TASK 2
%Returns product of all elements in list S
fun {Product S}
  case S of Head|Tail then
    Head*{Product Tail} %Multiply each element in list with the one before until no more elements left in tail.
  else
    1
  end
end

%TASK 3
/*
local StreamOddNumbers StreamProductOfList in
  thread StreamOddNumbers = {GenerateOdd 0 1000} end
  thread StreamProductOfList = {Product StreamOddNumbers} end
  {System.showInfo StreamProductOfList}
end

First three digits of output: 100

Benefit of running on two separate threads:
Running a concurrent process will make the process faster, because the other thread can use the already calculated
elements of list instead of waiting for it to complete fully.
*/
