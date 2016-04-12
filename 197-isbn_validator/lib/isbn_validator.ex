defmodule IsbnValidator do

  def valid?(isbn) do
    isbn
    |> String.replace("-", "")
    |> String.graphemes
    |> replace_ten
    |> Enum.map(&String.to_integer(&1))
    |> process
    |> Enum.sum
    |> divisible_by_11?
  end
  
  def replace_ten(list) do
    if List.last(list) == "X" do
      List.replace_at(list, length(list)-1, "10")
    else
      list
    end
  end
  
  def process([], _), do: []
  def process([h|t], n \\ 10) do
    [h * n | process(t, n-1) ]
  end
  
  defp divisible_by_11?(n) do
    rem(n, 11) == 0
  end
    
end
