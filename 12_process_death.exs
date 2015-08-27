defmodule MyProccess do
  def whatever do
    receive do
      {parent} ->
        send parent, {"hello"}
        exit(:crash)
    end
  end

  def run do
    # spawn_link: if child process die, parent as well
    pid = spawn_link(MyProccess, :whatever, [])
    send pid, self

    :timer.sleep(500)

    receive do
      {msg} ->
        IO.puts msg
    end
  end
end

IO.puts "running"
MyProccess.run