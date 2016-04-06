defmodule Easyletters do

  @data ~w(billowy biopsy chinos defaced chintz sponged
           bijoux abhors fiddle begins chimps wronged)
             
  def test(word) do
    word = String.to_char_list(word)
    cond do
      word == Enum.sort(word)               -> "#{word} IN ORDER"
      word == Enum.reverse(Enum.sort(word)) -> "#{word} REVERSE ORDER"
      true                                  -> "#{word} NOT IN ORDER"
    end
  end 
  
  def solve do
    @data
    |> Enum.each(&Easyletters.test(&1) |> IO.puts)
  end
end
