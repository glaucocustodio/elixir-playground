defmodule Guess do
  def calc(n, x, min..max = range) when n == x do
    IO.puts n
  end

  def calc(n, x, min..max = range) when x > n do
    IO.puts "Is it #{x}"    
    calc n, div((x-1)-min, 2) + min, min..x-1
  end

  def calc(n, x, min..max = range) when x < n do
    IO.puts "Is it #{x}"    
    calc n, div(max-(x+1), 2) + x+1, x+1..max
  end

  def the_number(n, range) do
    min..max = range[:between]
    # IO.puts n
    # IO.inspect [min, max]
    calc n, div(max-min,2)+min, min..max
  end
end

Guess.the_number 273, between: 1..1000
Guess.the_number 5001, between: 1..10000