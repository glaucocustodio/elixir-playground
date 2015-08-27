defmodule Parallel do
  def pmap(collection, func) do
    me = self

    collection 
    |> Enum.map(fn current -> 
      spawn_link fn -> send(me, {self, func.(current)}) end
    end)
    |> Enum.map(fn pid ->
      receive do 
        {_pid, result} -> result 
      end
    end)
  end
end

IO.inspect Parallel.pmap [1,2,3,4,5], &(&1*&1)