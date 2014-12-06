fb = fn
  {0, 0, _} -> "FizzBuzz"
  {0, _, _} -> "Fizz"
  {_, 0, _} -> "Buzz"
  {_, _, n} -> n
end

cfb = fn n ->
  IO.puts fb.({rem(n,3), rem(n,5), n})  
end

cfb.(1)
cfb.(3)
cfb.(5)
cfb.(15)