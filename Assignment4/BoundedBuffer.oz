%ASSIGNMENT 4, Bounded Buffer

%TASK 5

%a)
%Using function provided in assignment text to generate a random number
fun {RandomInt Min Max}
  X = {OS.rand}
  MinOS
  MaxOS
in
  {OS.randLimits ?MinOS ?MaxOS}
  Min + X*(Max - Min) div (MaxOS - MinOS)
end

%Returns a stream of hammers
%A hammer is either the atom working(90% of the cases) or the atom defect (10% of the cases)
%Factory produces 1 hammer each second
fun lazy {HammerFactory}
  {Delay 1000}
  if {RandomInt 1 10} > 1 then %In 90% of the cases...
    working | {HammerFactory}
  else                         %In 10% of the cases...
    defect | {HammerFactory}
  end
end

%b)
%Takes a stream and a number, reads the first N elements from the HammerStream and returns the amount of working hammers
fun {HammerConsumer HammerStream N}
  if N == 0 then
    0
  else
    case HammerStream of H|T then
      if H == working then
        1+{HammerConsumer T N-1}
      else
        0+{HammerConsumer T N-1}
      end
    else
      0
    end
  end
end


%c)
%Takes a stream of hammers and returns a bounded buffer with size N.
fun {BoundedBuffer HammerStream N}
  End = thread {List.drop HammerStream N} end  %Whenever List.drop is called with HammerStream as argument (HammerStream being
                                               %a result of the lazy function HammerFactory) the next element of the list will be
                                               %requested - this means that the lazy function will "prepare" the first N elements
                                               %from HammerFactory to be used for later (a buffer).
  fun lazy {GetBufferValues HammerStream End}
    case HammerStream of H|T then             %As long as HammerStream has a Head/Tail pattern...
      H|{GetBufferValues T thread End.2 end}  %Add first element of current HammerStream-list, make a recursive call
                                              %to the GetBufferValues with the reduced list and add all values corresponding
                                              %to each already generated element of HammerStream. It adds the new value to the list
                                              %and pushes end a step further away. Using seperate threads, the values can be used once they
                                              %are retrieved - the whole operation does not have to be completed before use - and
                                              %only the necessary elements are requested. Saves time!
    end
  end
  in {GetBufferValues HammerStream End} %Calling function with End
end
