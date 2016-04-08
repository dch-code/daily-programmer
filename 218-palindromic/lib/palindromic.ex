defmodule Palindromic do

  def test(n) do
    n == reversed(n)
  end
  
  def go(n), do: go(n, 0, n)
  
  defp go(n, steps, current) do
    if test(current) do
      IO.puts "#{n} gets palindromic after #{steps} steps: #{current}"
      current
    else
      IO.puts "No solution at step #{steps}. Last check was #{String.length(to_string(current))} digits long."
      step(n, steps, current)
    end
  end
  
  
  defp step(n, steps, current) do
    new_value = current + reversed(current)
    go(n, steps + 1, new_value)
  end
  
  defp reversed(n) do
    n
    |> to_string
    |> String.reverse
    |> String.to_integer
  end
end