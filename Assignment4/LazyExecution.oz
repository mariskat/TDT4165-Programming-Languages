%ASSIGNMENT 4, Lazy execution

%TASK 4
/*
How does this affect task 3 in terms of throughput and resource usage?

Using lazy implementation, the throughput will be larger, while - in this case - the
resource usage will stay the same.
This is because the thread generating the list with odd numbers, doesnt have to
actually create the list, it will only provide the list-elements whenever the thread
multiplying the elements requires it. This means that in this case, each of the elements
of the list has to be requested, generated and then used in the calculation, instead of the
list being generated straightforward and then used - this will take more time than
by not using lazy implementation. The resource use, however, will remain the same. This
is because the same operations are still performed - generating list and calculating product.
*/

%Generates a stream og odd numbers between S and E in ascending order LAZY IMPLEMENTATION
fun lazy {LazyGenerateOdd S E}
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
