defmodule PalindromicTest do
  use ExUnit.Case
  doctest Palindromic

  test "can determine that a number is palindromic" do
    assert Palindromic.test(242) == true
  end
  
  test "can determine that a number is not palindromic" do
    assert Palindromic.test(24) == false
  end
  
  test "can find a palindromic solution to any number" do
    assert Palindromic.go(34367) == 127721
  end
  
end
