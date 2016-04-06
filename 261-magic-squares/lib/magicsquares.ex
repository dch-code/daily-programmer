defmodule Magicsquares do

  def play_games(list_of_games) do
     list_of_games
     |> Enum.each(&play(&1))
  end
  
  def play(game) do
    game
    |> create_tests
    |> evaluate_tests
    |> format_results
  end
 
  defp format_results({game, result}) do
    IO.puts "#{inspect game} => #{result}"
  end
 
  defp create_tests(game) do
    {game, get_rows(game) ++ get_columns(game) ++ get_diags(game)}
  end
 
  defp evaluate_tests({game, list_of_tests}) do
    {game, Enum.all?(list_of_tests, &is_magic_row?(&1))}
  end
 
  defp get_rows(game) do
    game
    |> Enum.chunk(3)
  end
  
  defp get_columns(game) do
    [row1, row2, row3] = get_rows(game)
    [[Enum.at(row1, 0), Enum.at(row2, 0), Enum.at(row3, 0)],
     [Enum.at(row1, 1), Enum.at(row2, 1), Enum.at(row3, 1)],
     [Enum.at(row1, 2), Enum.at(row2, 2), Enum.at(row3, 2)]]
  end
  
  defp get_diags(game) do
    [row1, row2, row3] = get_rows(game)
    [[Enum.at(row1, 0), Enum.at(row2, 1), Enum.at(row3, 2)],
     [Enum.at(row1, 2), Enum.at(row2, 1), Enum.at(row3, 0)]]
  end
  
  defp is_magic_row?(test) do
    Enum.sum(test) == 15
  end
  
end
