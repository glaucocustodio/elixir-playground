defmodule MyEnum do
  # Invokes the given func for each item
  # in the collection and returns false if at least
  # one invocation returns false. Otherwise returns true.
  def all?([], _), do: true
  def all?([head | tail], func) do
    func.(head) && all?(tail, func)
  end

  # Invokes the given fun for each item in the collection. Returns :ok
  def each([], _), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter(list, func, t \\ [])
  def filter([], _, t), do: t
  def filter([head | tail], func, t) do
    if func.(head) do
      t = t ++ [head]
    end
    filter(tail, func, t)
  end

  # Set default parameters
  def split(_, _, t \\ {[], []})
  # Anchor case
  def split([], _, t), do: t
  def split([head | tail], count, t) when length(elem(t, 0)) < count do
    t = put_elem(t, 0, elem(t, 0) ++ [head])
    split(tail, count, t)
  end
  def split([head | tail], count, t) do
    t = put_elem(t, 1, elem(t, 1) ++ [head])
    split(tail, count, t)
  end
end

# Should return true
IO.puts MyEnum.all?([2,4,6], fn(x) -> rem(x, 2) == 0 end)
# Should return false
IO.puts MyEnum.all?([1,2,4,6], fn(x) -> rem(x, 2) == 0 end)

# Should display 'hello\nworld'
IO.inspect MyEnum.each(["hello", "world"], fn(x) -> IO.puts x end)

# Filters the collection, returns only those elements for which fun returns true
IO.inspect MyEnum.filter([1,2,3,4,5,6,12], fn(x) -> rem(x, 3) == 0 end)

IO.inspect MyEnum.split([1,2,3,4], 1)
IO.inspect MyEnum.split([1,2,3,4], 2)
IO.inspect MyEnum.split([1,2,3,4], 3)
IO.inspect MyEnum.split([1,2,3,4], 4)