defmodule Stdev do
  
  def average(list) do
    Enum.sum(list) / Enum.count(list)
  end
  
  def diffs(list) do
    Enum.map(list, &(&1 - average(list)))
  end
  
  def diffs_squared(list) do
    list
    |> diffs
    |> Enum.map(&(&1 * &1))
  end
  
  def variance(list) do
    list
    |> diffs
    |> diffs_squared
    |> average
  end
  
  def stdev(list) do
    :math.sqrt variance(list)
  end
    
end
