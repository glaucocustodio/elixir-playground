# Named functions need belongs to a module
# def test do
#   IO.puts "bar"
# end
# test

defmodule Foo do
  def bar do
    IO.puts "bar"
  end
end

Foo.bar

defmodule Times do
  def double(n), do: n * 2

  def double2(n), do: (
    IO.puts n * 2
  )

  def triple(n), do: n * 3

  def quadruple(n) do
    # double(double(n))
    n |> double |> double # same as above using the pipe operator
  end

  def sum(1), do: 1
  def sum(n), do: n + sum(n-1)

  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x,y))
end

IO.puts Times.double 2
Times.double2 3

IO.puts Times.triple 3
IO.puts Times.quadruple 10

IO.puts Times.sum(3)
IO.puts Times.sum(5)

IO.puts Times.gcd(32, 2048)