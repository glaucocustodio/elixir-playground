# Format a float number to a string through
# an Erlang function
:io.format "~5.2f~n", [23.232]

# Read an environment variable
IO.puts System.get_env "HOME"

# Returns the extension of the last component of given path
IO.puts Path.extname("2_fizz_buzz.exs")

# Returns the current working directory
IO.puts System.cwd

# Executes a shell command
IO.inspect System.cmd "ls", ["-l"]