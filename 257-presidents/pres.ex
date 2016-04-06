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
    |> Enum.max_by(fn({_, v}) -> v end)
  end
  
  def parse([line]) do
    [_, b, _, d, _] = String.split(line, ",")
    b = String.strip(String.slice(b, -4, 4))
    d = String.strip(String.slice(d, -4, 4))
    {b, d}
  end
  
  def make_ints({b, d}) do
    case d do
      "" -> {{y, _, _}, _} = :calendar.local_time
            {String.to_integer(b), y}
      _  -> {String.to_integer(b), String.to_integer(d)}
    end
  end
  
  def years_alive{b, d} do
    Enum.to_list(b..d)
  end
  
end