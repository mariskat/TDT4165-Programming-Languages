%ASSIGNMENT 1 (ASSIGNMENT 2 TASK 1)

%Length function returning count of elements in list
fun {Length List}
  case List of Head|Tail then
    1+{Length Tail}
  else
    0
  end
end

%Function returning sum of elements in list
fun {Sum List}
  case List of Head|Tail then
    Head+{Sum Tail}
  else
    0
  end
end

%Take returns first Count elements of list
fun {Take List Count}
  if Count == 0 then
    nil
  else
    case List of H|T then
      H|{Take T Count-1}
    else
      nil
    end
  end
end

%Drop function returning list without first Count elements
fun {Drop List Count}
  if Count > {Length List} then
    {System.showInfo "Count larger than elements in list"}
    nil
  else
    case List of Head|Tail then
      if Count > 0 then
        {Drop Tail Count-1}
      else
        List
      end
    else
      nil
    end
  end
end

%Append function returns list 1 and list 2 respectively as united list
fun {Append List1 List2}
  case List1 of H1|T1 then
    H1|{Append T1 List2}
  else
    case List2 of H2|T2 then
      H2|{Append List1 T2}
    else
      nil
    end
  end
end


%Member returns true if element is in list (and the opposite)
fun {Member List Element}
  case List of H|T then
    if H == Element then
      true
    else
      {Member T Element}
    end
  else
    false
  end
end

%Position returns position of Element in List, assuming it always is in list
fun {Position List Element}
  case List of H|T then
    if H == Element then
      1
    else
      1+{Position T Element}
    end
  else
    0
  end
end
