defmodule Tetris do
  
  @tiles ~w(O I S Z L J T)
  
  def deal(number) do
    :random.seed(:os.timestamp)
    _deal([], number, [])
  end
  
  defp _deal(_, 0, acc), do: acc |> Enum.join
  
  defp _deal([], number, acc) do
    _deal(_new_bag, number, acc)
  end

  defp _deal([tile|bag], number, acc) do
    _deal(bag, number - 1, [tile|acc])
  end
  
  defp _new_bag do
    Enum.shuffle @tiles
  end
end