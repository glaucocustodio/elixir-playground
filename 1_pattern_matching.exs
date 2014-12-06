# match
[a, b, a] = [1, 2, 1]

# does not match, `a` is already defined
# [a, b, a] = [1, 2, 3]

a = 1

# `^` avoid rebinding
# ^a = 2

a = 3
IO.puts a

open_handler = fn
  {:ok, file}  -> {IO.puts "Success!"}
  {_,   error} -> {IO.puts "Something went wrong: #{error}"}
end

open_handler.(File.open "foo.tt")
open_handler.(File.open "fb.exs")