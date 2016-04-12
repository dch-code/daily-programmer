defmodule Palindromic do

  def is_palindrome?(n) do
    n == reversed(n)
  end
  
  def go(n), do: go(n, 0, n)
  
  defp go(n, steps, current) do
    if is_palindrome?(current) do
      IO.puts "#{n} gets palindromic after #{steps} steps: #{current}"
      current
    else
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