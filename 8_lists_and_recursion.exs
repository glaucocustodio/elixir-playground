defmodule MyList do
  def sum([]), do: 0

  def sum([head | tail]), do: head + sum(tail)


  def mapsum([], _fun), do: 0

  def mapsum([head | tail], fun) do
    fun.(head) + mapsum(tail, fun)
  end


  def maxf(list, gt \\ 0)
  def maxf([], gt), do: gt

  def maxf([head | tail], gt) when head < gt do
    maxf(tail, gt)
  end

  def maxf([head | tail], gt) when head >= gt do
    maxf(tail, head)
  end


  def caesar([], _), do: []
  def caesar([head | tail], n) when (head + n) > 122 do
    [63 | caesar(tail, n)]
  end
  def caesar([head | tail], n) when (head + n) <= 122 do
    [head + n | caesar(tail, n)]
  end


  def caesar_b([], _), do: []
  def caesar_b([head | tail], n) do
    [head - n | caesar_b(tail, n)]
  end
end

IO.puts MyList.sum([1, 2, 3, 4])
IO.puts MyList.sum([1, 1])

# Second argument is an anonymous function
IO.puts MyList.mapsum([1,2,3], &(&1*&1))

IO.puts MyList.maxf([1,2,3,20,40])
IO.puts MyList.maxf([50,4,3,2,1])

IO.puts MyList.caesar('ryvkve', 13)
IO.puts MyList.caesar('abcdefghijklmnopqrstuvwxyz', 13)
IO.puts MyList.caesar_b('XMFRJ%TS%^TZ', 5)