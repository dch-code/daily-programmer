defmodule DateDilemma do

  def convert(date) do
    cond do
      String.contains?(date, "/") -> format(String.split(date, "/"))
      String.contains?(date, "-") -> format(String.split(date, "-"))
      String.contains?(date, " ") -> format(String.split(date, " "))
    end
  end

  def format([x, y, z]) do
    cond do
      String.length(x) == 4 ->
        [year, month, day] = [x, y, z]
        IO.puts "#{year}-#{String.rjust(month, 2, ?0)}-#{String.rjust(day, 2, ?0)}"
      true                   ->
        [month, day, year] = [x, y, z]
        cond do
          String.to_integer(year) <= 16  -> 
            IO.puts "#{String.to_integer(year)+2000}-#{String.rjust(month, 2, ?0)}-#{String.rjust(day, 2, ?0)}"
          String.to_integer(year) > 2000 ->
            IO.puts "#{year}-#{String.rjust(month, 2, ?0)}-#{String.rjust(day, 2, ?0)}"
          true                           ->
            IO.puts "#{String.to_integer(year)+1900}-#{String.rjust(month, 2, ?0)}-#{String.rjust(day, 2, ?0)}"
        end
    end
  end
end