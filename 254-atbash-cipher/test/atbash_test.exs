defmodule AtbashTest do
  use ExUnit.Case
  doctest Atbash
  
  test "phrases with spaces are properly translated" do
    string = "gsrh rh zm vcznkov lu gsv zgyzhs xrksvi"
    answer = "this is an example of the atbash cipher"
    assert answer == Atbash.translate(string)
  end

end