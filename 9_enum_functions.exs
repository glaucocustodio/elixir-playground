defmodule MyEnum do
  # Invokes the given func for each item
  # in the collection and returns false if at least
  # one invocation returns false. Otherwise returns true.
  def all?([], _), do: true
  def all?([head | tail], func) do
    func.(head) && all?(tail, func)
  end
end

# Should return true
IO.puts MyEnum.all?([2,4,6], fn(x) -> rem(x, 2) == 0 end)

# Should return false
IO.puts MyEnum.all?([1, 2,4,6], fn(x) -> rem(x, 2) == 0 end)