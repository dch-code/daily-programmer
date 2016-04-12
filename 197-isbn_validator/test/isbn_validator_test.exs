defmodule IsbnValidatorTest do
  use ExUnit.Case
  doctest IsbnValidator

  @valid_isbn "0-7475-3269-9"
  @valid_isbn_x "156881111X"
  @invalid_isbn "0-7475-3269-8"

  test "can determine a valid ISBN" do
    assert IsbnValidator.valid?(@valid_isbn) == true
  end
  
  test "rejects an invalid ISBN" do
    refute IsbnValidator.valid?(@invalid_isbn) == true
  end
  
  test "accepts ISBN with trailing X" do
    assert IsbnValidator.valid?(@valid_isbn_x) == true
  end
  
end
