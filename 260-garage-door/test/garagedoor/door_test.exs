defmodule DoorTest do
  use ExUnit.Case
  
  test "initial state is closed" do
    assert Door.new.state == :closed
  end
  
  test "clicking a closed door starts opening" do
    door = 
      Door.new |> Door.click
    assert door.state == :opening
  end
  
  test "clicking an opening door starts closing" do
    door = 
      Door.new |> Door.click |> Door.click
    assert door.state == :closing
  end
  
  test "clicking a closing door starts opening" do
    door = 
      Door.new
      |> Door.click 
      |> Door.click
      |> Door.click
    assert door.state == :opening
  end
  
  test "cycle complete on an opening door opens it" do
    door =
      Door.new |> Door.click |> Door.cycle_complete
    assert door.state == :open
  end
  
  test "cycle complete on a closing door closes it" do
    door =
      Door.new # :closed
      |> Door.click # :opening
      |> Door.cycle_complete # :open
      |> Door.click # :closing
      |> Door.cycle_complete # :closed
    assert door.state == :closed
  end
  
  test "clicking an open door starts closing" do
  end
    
end