%ASSIGNMENT 3

%TASK 5
%a)

fun {LazyNumberGenerator StartValue}
  %{System.show StartValue}
  incrementIndefiniteRecord(StartValue fun {$} {LazyNumberGenerator StartValue+1} end)
end

/*
b)
A record, incrementIndefiniteRecord, contains StartValue and an anonymous function.
This anonymous function performs a recursive call to LazyNumberGenerator, where StartValue
is incremented. Whenever the functioncall in main requires the elements of the returnvalue of
LazyNumberGenerator, the anonymous function performs its recursive call. This way,
the lazy property is acchieved - the calculation/incrementation are not performed before it is required.

When LazyNumberGenerator is called with .1, it will return the current(updated/incremented) value of StartValue.
For the next calls, it will retrieve the second element, which will increment for each
call of the anonymous function.
*/
