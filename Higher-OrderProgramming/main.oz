%ASSIGNMENT 3: Higher-order programming

functor
import
  Application
  System
define
  \insert ProceduralAbstraction.oz
  \insert Genericity.oz
  \insert Instantiation.oz
  \insert Embedding.oz
  %\insert TailRecursion.oz

%Example code for testing functions:

  %Task 1
  /*
  local RealSol X1 X2 in
  %{QuadraticEquation 2.0 1.0 2.0 RealSol X1 X2} %X1 and X2 = <optimized> and RealSol = false
  %{QuadraticEquation 2.0 1.0 ~1.0 RealSol X1 X2} %X1= 0.5, X2=~1 and RealSol = true
  {System.show X1}
  {System.show X2}
  {System.show RealSol}
  end
  */

  %Task 2
  %{System.show {Sum [2 3 5]}}

  %Task 3
  %{System.show {RightFoldSum [3 4 1]}}
  %{System.show {RightFoldLength [5 4 1]}}

  %Task 4
  %{System.show {{Quadratic 3 2 1} 2}}

  %Task 5
  %{System.show {LazyNumberGenerator 0}.1}
  %{System.show {{LazyNumberGenerator 0}.2}.1}
  %{System.show {{{{{{LazyNumberGenerator 0}.2}.2}.2}.2}.2}.1 }

{Application.exit 0}
end
