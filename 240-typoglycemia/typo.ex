defmodule Typo do

  def load(file) do
    File.stream!(file)
  end

  def convert(data) do
    data
    |> Enum.chunk(1) # => [["Text text"], ["Text text"]]
    |> List.flatten # => ["Text text", "Text text"]
    |> Enum.map(&String.split(&1, " ")) # => [["Text", "text"], ["Text", "text"]]
    |> Enum.map(&List.delete(&1, "\n")) # => [["Text", "text"], ["Text", "text"]]
    |> List.flatten
    |> Enum.map(&translate(&1))
    |> Enum.join(" ")
  end
  
  def translate(word) do
    cond do
      String.length(to_string(word)) <= 2 -> word
      true                     ->
        first = String.first(word)
        last  = String.last(word)
        mid   = 
                String.replace_leading(word, first, "")
                |> String.replace_trailing(last, "")
                |> String.reverse
        #mid = String.replace_leading(word, first, "")
        #mid = String.replace_trailing(mid, last, "")
        #mid = String.reverse(mid)
        first <> mid <> last
    end
  end
  # def print(list) do
  #   Enum.reduce(list, "", fn(x, acc) -> acc <> " " <> x end)
  #   |> String.lstrip
  # end
end