Enum.map [1,2,3,4], &(IO.puts &1+2)

IO.puts '----------'

Enum.each [1,2,3,4], &(IO.inspect &1)