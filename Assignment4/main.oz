%ASSIGNMENT 4: DECLARATIVE CONCURRENCY

functor
import
  System
  Application
  OS
define
  \insert StreamsAndThreads.oz
  \insert LazyExecution.oz
  \insert BoundedBuffer.oz

%EXAMPLE-CODE TO TEST FUNCTIONS:

  %Task 1
  %{System.show {GenerateOdd ~3 10}} %should print [∼3 ∼1 1 3 5 7 9].
  %{System.show {GenerateOdd 3 3}} %should print [3].
  %{System.show {GenerateOdd 2 2}} %should print nil.

  %Task 2
  %{System.show {Product [1 2 3 4]}} %should print 24.

  %Task 3
  /*
  local StreamOddNumbers StreamProductOfList in
    %Generate list with odd numbers spanning from 0 to 1000 on thread 1
    thread StreamOddNumbers = {GenerateOdd 0 1000} end
    %Multiply each element of the list on thread 2
    thread StreamProductOfList = {Product StreamOddNumbers} end
    {System.showInfo StreamProductOfList}
  end
  */

  %Task 4
  %{System.show {LazyGenerateOdd ~3 10}.2.2.2.1} % should print 3

  %Task 5
  %a)
  %This should after a 4 second delay print something like: working|defect|working|working| <optimized>.
  /*
  local HammerTime B in
    HammerTime = {HammerFactory}
    B = HammerTime.2.2.2.1
    {System.show HammerTime}
  end
  */

  %b)
  %This should after a 10 second delay print a number. On average the number should be 9.
  /*
  local HammerTime Consumer in
    HammerTime = {HammerFactory}
    Consumer = {HammerConsumer HammerTime 10}
    {System.show Consumer}
  end
  */

  %c)
  %Execution time should be approximately 10 and 16 seconds.
  %With buffer:
  /*
  local HammerStream Buffer in
    HammerStream = {HammerFactory}
    Buffer = {BoundedBuffer HammerStream 6}
    {Delay 6000}
    Consumer = {HammerConsumer Buffer 10}
    {System.show Consumer}
  end
  */

  %Without buffer:
  /*
  local HammerStream in
    HammerStream = {HammerFactory}
    {Delay 6000}
    Consumer = {HammerConsumer HammerStream 10}
    {System.show Consumer}
  end
  */

  {Application.exit 0}
end
