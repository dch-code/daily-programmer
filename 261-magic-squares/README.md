# Magic Squares

A solution to https://www.reddit.com/r/dailyprogrammer/comments/4dccix/20160404_challenge_261_easy_verifying_3x3_magic/

```elixir
iex(1)> games = [[8, 1, 6, 3, 5, 7, 4, 9, 2],
...(1)>          [2, 7, 6, 9, 5, 1, 4, 3, 8],
...(1)>          [3, 5, 7, 8, 1, 6, 4, 9, 2],
...(1)>          [8, 1, 6, 7, 5, 3, 4, 9, 2]]
 
iex(2)> games |> Magicsquares.play_games
[8, 1, 6, 3, 5, 7, 4, 9, 2] => true
[2, 7, 6, 9, 5, 1, 4, 3, 8] => true
[3, 5, 7, 8, 1, 6, 4, 9, 2] => false
[8, 1, 6, 7, 5, 3, 4, 9, 2] => false
:ok 
```

## Usage


## r/DailyProgrammer #261
### Description
A 3x3 magic square is a 3x3 grid of the numbers 1-9 such that each row, column, and major diagonal adds up to 15. Here's an example:

```
8 1 6
3 5 7
4 9 2
```
Write a function that, given a grid containing the numbers 1-9, determines whether it's a magic square. Use whatever format you want for the grid, such as a 2-dimensional array, or a 1-dimensional array of length 9, or a function that takes 9 arguments. You do not need to parse the grid from the program's input, but you can if you want to. You don't need to check that each of the 9 numbers appears in the grid: assume this to be true.

### Example inputs/outputs
```
[8, 1, 6, 3, 5, 7, 4, 9, 2] => true
[2, 7, 6, 9, 5, 1, 4, 3, 8] => true
[3, 5, 7, 8, 1, 6, 4, 9, 2] => false
[8, 1, 6, 7, 5, 3, 4, 9, 2] => false
```