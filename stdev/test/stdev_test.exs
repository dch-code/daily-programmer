defmodule StdevTest do
  use ExUnit.Case
  alias Stdev
  doctest Stdev
  
  @data [5, 6, 11, 13, 19, 20, 25, 26, 28, 37]

  test "can get the average of a list" do
    assert 19 == Stdev.average(@data)
  end
   
  test "can find the distance from the mean for each list item" do
    assert [-14, -13, -8, -6, 0, 1, 6, 7, 9, 18] == Stdev.diffs(@data) 
  end
  
  test "can find the variance of a list" do
    assert 95.6 == Stdev.variance(@data) 
  end
  
  test "can find the standard deviation of a list" do
    assert 9.777525249264253 == Stdev.stdev(@data)
  end
end
