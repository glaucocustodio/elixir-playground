taxes = [NC: 0.075, TX: 0.08]

orders = [
  [id: 123, ship_to: :NC, net_amount: 100],
  [id: 124, ship_to: :OK, net_amount: 35.50],
  [id: 125, ship_to: :TX, net_amount: 24.00],
]

defmodule MyTaxes do
  # Apply given taxes for orders based on county
  def calc(_,_,final \\ [])
  def calc([], _, final), do: final
  def calc([h|t], taxes, final) do
    tax = taxes[h[:ship_to]]
    total_amount = h[:net_amount]
    if tax do
      total_amount = (tax * h[:net_amount]) + h[:net_amount]
    end
    final = final ++ List.insert_at(h, -1, {:total_amount, total_amount})
    calc(t, taxes, final)
  end
end

IO.inspect MyTaxes.calc(orders, taxes)