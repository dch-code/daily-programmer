defmodule ProgTax do
  alias :math, as: Math

  def get_tax_owed_in_dollars(income) do
    get_tax_rate(income)
    |> Enum.map(fn({rate, amount}) -> rate * amount end)
    |> Enum.sum
    |> Math.floor
  end

  defp get_tax_rate(income) when income > 100_000 do
    [{0.40, income - 100_000} | get_tax_rate(income - (income - 100_000))]
  end
  defp get_tax_rate(income) when income > 30_000 do
    [{0.25, income - 30_000} | get_tax_rate(income - (income - 30_000))]
  end
  defp get_tax_rate(income) when income > 10_000 do
    [{0.10, income - 10_000} | get_tax_rate(income - (income - 10_000))]
  end
  defp get_tax_rate(_income), do: []

end
