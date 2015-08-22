defmodule MyGreeter do
  def greet do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello #{msg}"}
    end
  end
end

pid = spawn(MyGreeter, :greet, [])
pid2 = spawn(MyGreeter, :greet, [])

send pid, {self, "fred"}
send pid2, {self, "betty"}

receive do
  {:ok, msg} ->
    IO.puts msg
end

receive do
  {:ok, msg} ->
    IO.puts msg
end