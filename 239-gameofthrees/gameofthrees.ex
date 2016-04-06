defmodule GameOfThrees do
  
  # If the number is divisible by 3, do it
  # If its not, either add one or subtract one
  # Then try it again
  
  def play do
    input = IO.gets "> Enter a number to play: "
    {n, _} = String.strip(input)
             |> Integer.parse 
    if n < 0 do
      IO.puts "Number cannot be less than zero. Please play again."
    else
      solve(n, 0)
    end
  end
  
  defp solve(0, steps) do
    IO.puts "0\nDone in #{steps} steps."
  end
  
  defp solve(number, steps) when number > 0 do
    IO.puts "#{number}, Step: #{steps}"
    cond do
      rem(number, 3) == 0 -> solve(div(number,3), steps + 1)
      number - 1 >= 0     -> solve(number - 1, steps + 1)
      number + 1 >= 0     -> solve(number + 1, steps + 1)
    end
  end
  
  
end