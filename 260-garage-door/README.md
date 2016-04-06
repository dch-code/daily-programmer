# Garage Door (FSM)

A solution to https://www.reddit.com/r/dailyprogrammer/comments/4cb7eh/20160328_challenge_260_easy_garage_door_opener/

## Usage

```elixir
Door.new # creates a new door with state `:closed`
Door.click # clicks garage door button to transition to either `:opening` or `:closed`
Door.cycle_complete # finish transitiong to either `:opening` or `:closed`
```

If `Door.click` is pressed while the door is either still opening or still closing (aka before the cycle is completed), it will stop opening and start closing, or vice versa. 

## Solution
```elixir
iex(1)> Door.new |> Door.click |> Door.cycle_complete |> Door.click |> Door.click |> Door.click |> Door.click |> Door.click |> Door.cycle_complete
Button clicked.
Door: OPENING
Cycle complete.
Door: OPEN
Button clicked.
Door: CLOSING
Button clicked.
Door: STOPPED_WHILE_CLOSING
Button clicked.
Door: STOPPED_WHILE_OPENING
Button clicked.
Door: STOPPED_WHILE_CLOSING
Button clicked.
Door: STOPPED_WHILE_OPENING
Cycle complete.
Door: CLOSED
%Door{data: nil, state: :closed}
```