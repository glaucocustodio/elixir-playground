prefix = fn pre ->
  fn str ->
    pre <> " " <> str
  end
end

mr = prefix.("Mr.")
IO.puts  mr.("Anderson")