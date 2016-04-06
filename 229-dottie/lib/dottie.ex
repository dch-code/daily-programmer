defmodule Dottie do

  def play do
    input = IO.gets "> Enter a number: "
    {n, _} = String.strip(input)
             |> Integer.parse
    dottie(n, 0)
  end
  
  defp dottie(n, s) do
    dottie(:math.cos(n), n, s)
  end
  
  defp dottie(m, n, s) do
    IO.puts "Step: #{s}. m: #{m}, n: #{n}"
    cond do
      m == n -> IO.puts "Finished. #{m}"
      true   -> dottie(:math.cos(m), m, s + 1)
    end
  end
end
