defmodule MyList do
  def sum([]), do: 0

  def sum([head | tail]), do: head + sum(tail)


  def mapsum([], _fun), do: 0

  def mapsum([head | tail], fun) do
    fun.(head) + mapsum(tail, fun)
  end

  # `\\` set default value for parameter
  def maxf(list, gt \\ 0)
  def maxf([], gt), do: gt

  def maxf([head | tail], gt) when head < gt do
    maxf(tail, gt)
  end

  def maxf([head | tail], gt) when head >= gt do
    maxf(tail, head)
  end


  # 122 code represents the character `z`
  def caesar([], _), do: []
  def caesar([head | tail], n) when (head + n) > 122 do
    [63 | caesar(tail, n)]
  end
  def caesar([head | tail], n) when (head + n) <= 122 do
    [head + n | caesar(tail, n)]
  end

  # Subtracts 5 of each character in the list
  def caesar_b([], _), do: []
  def caesar_b([head | tail], n) do
    [head - n | caesar_b(tail, n)]
  end

  def span(from, to) when from > to, do: []
  def span(from, to) when from <= to do
    [from|span(from+1, to)]
  end

  # Returns true if given number is prime
  def is_prime(n), do: is_prime(n, n, 0)
  def is_prime(_, 0, true_occ) when true_occ == 2, do: true
  def is_prime(_, 0, true_occ) when true_occ != 2, do: false
  def is_prime(n, d, true_occ) do
    if rem(n, d) == 0 do
      true_occ = true_occ + 1
    end
    is_prime(n, d-1, true_occ)
  end
end

# Sum all values from list
IO.puts MyList.sum([1, 2, 3, 4])
IO.puts MyList.sum([1, 1])

# Second argument is an anonymous function
IO.puts MyList.mapsum([1,2,3], &(&1*&1))

# Get the maximum value from list
IO.puts MyList.maxf([1,2,3,20,40])
IO.puts MyList.maxf([50,4,3,2,1])


# Single quoted string represents a 
# list of individual ASCII character codes
# By modifying (adding, subtracting) them 
# we can change the character

# Replaces characteres greater than `z` with `?`
IO.puts MyList.caesar('ryvkve', 13)
IO.puts MyList.caesar('abcdefghijklmnopqrstuvwxyz', 13)

# Encryption code to the sentence: `SHAME ON YOU`
IO.puts MyList.caesar_b('XMFRJ%TS%^TZ', 5)

IO.inspect MyList.span(1, 10)
# `inspect` forces displaying a list of integers instead a charlist
IO.puts inspect(MyList.span(52, 100), char_lists: :as_lists)

IO.puts "2 is prime?"
IO.puts MyList.is_prime(2)
IO.puts "3 is prime?"
IO.puts MyList.is_prime(3)
IO.puts "7 is prime?"
IO.puts MyList.is_prime(7)

# Returns all prime numbers from 2 to n
IO.inspect for c <- MyList.span(2, 100), MyList.is_prime(c) == true, do: c