defmodule Atbash do
  
  @plain  ~w(a b c d e f g h i j k l m n o p q r s t u v w x y z /)
  @cipher ~w(z y x w v u t s r q p o n m l k j i h g f e d c b a /)
  
  def translate(string) do
    string
    |> String.graphemes
    |> swap_chars(Atbash.cipher_key)
    |> fix_nils
    |> Enum.join
  end

  def cipher_key do
    plain = Enum.map(@plain, &String.to_atom(&1))
    Enum.zip(plain, @cipher)
  end
  
  def swap_chars(list_of_chars, cipher_key) do
    Enum.map(list_of_chars, &cipher_key[String.to_atom(&1)])
  end
  
  def fix_nils(list_of_chars) do
    list_of_chars
    |> Enum.map(fn(c) ->
      case c do
        nil -> " "
        _   -> c
      end
    end)
  end
    
end