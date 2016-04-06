defmodule Door do
  use Fsm, initial_state: :closed
  
  defstate closed do
    defevent click do
      show_click
      announce_door("OPENING")
      next_state(:opening)
    end
  end
  
  defstate open do
    defevent click do
      show_click
      announce_door("CLOSING")
      next_state(:closing)
    end
  end
  
  defstate opening do
    defevent click do
      show_click
      announce_door("STOPPED_WHILE_OPENING")
      next_state(:closing)
    end
    defevent cycle_complete do
      show_cycle_complete
      announce_door("OPEN")
      next_state(:open)
    end
  end
  
  defstate closing do
    defevent click do
      show_click
      announce_door("STOPPED_WHILE_CLOSING")
      next_state(:opening)
    end
    defevent cycle_complete do
      show_cycle_complete
      announce_door("CLOSED")
      next_state(:closed)
    end
  end
  
  def show_click do
    IO.puts "Button clicked."
  end
  
  def show_cycle_complete do
    IO.puts "Cycle complete."
  end
  
  def announce_door(status) do
    IO.puts "Door: #{String.upcase status}"
  end
end
