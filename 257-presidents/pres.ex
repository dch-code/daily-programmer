defmodule Pres do
  
  def run(filename) do
    filename
    |> File.stream!
    |> Enum.map(&([String.strip(&1)]))
    |> Enum.map(&parse(&1))
    |> Enum.drop(1)
    |> Enum.map(&make_ints(&1))
    |> Enum.map(&years_alive(&1))
    |> List.flatten
    |> Enum.reduce(%{}, &Map.update(&2, &1, 1, fn(n) -> n + 1 end))
    |> Enum.sort_by(fn({_, v}) -> v end)
    |> Enum.reverse
    #|> Enum.max_by(fn({_, v}) -> v end)
  end
  
  def parse([line]) do
    [_, b, _, d, _] = String.split(line, ",")
    b = 
      b
      |> String.slice(-4, 4)
      |> String.strip
    d = 
      d
      |> String.slice(-4, 4)
      |> String.strip
      
    case d do
      "" -> {{d, _, _}, _} = :calendar.local_time
            d
      _  -> String.to_integer(d)
    end
    
    {b, d}
  end
  
  def make_ints({b, d}) do
  end
  
  def years_alive{b, d} do
    Enum.to_list(b..d)
  end
  
end