defmodule DateDilemma do

  def convert(date) do
    date      # => "2/14/15"
    |> split  # => ["2", "14", "15"]
    |> format # => ["2015", "14", "02"]
    |> print  # => "2015-02-14"
  end

  defp split(date) do
    cond do
      String.contains?(date, "/") -> String.split(date, "/")
      String.contains?(date, "-") -> String.split(date, "-")
      String.contains?(date, " ") -> String.split(date, " ")
    end
  end

  defp format([x, y ,z]) do
    cond do
      String.length(x) == 4 -> 
        [year, month, day] = [x, y, z]
        {year, rjust(month), rjust(day)}
      true                  ->
        [month, day, year] = [x, y, z]
        cond do
          String.to_integer(year) <= 16  -> 
            {"20" <> year, rjust(month), rjust(day)}
          String.to_integer(year) > 2000 -> 
            {year, rjust(month), rjust(day)}
          true                           -> 
            {"19" <> year, rjust(month), rjust(day)}
        end
    end
  end
  
  defp rjust(s) do
    String.rjust(s, 2, ?0)
  end
  
  defp print({year, month, day}) do
    IO.puts "#{year}-#{month}-#{day}"
  end
end