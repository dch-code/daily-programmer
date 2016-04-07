
https://www.reddit.com/r/dailyprogrammer/comments/45w6ad/20160216_challenge_254_easy_atbash_cipher/

## Description
Atbash is a simple substitution cipher originally for the Hebrew alphabet, but possible with any known alphabet. It emerged around 500-600 BCE. It works by substituting the first letter of an alphabet for the last letter, the second letter for the second to last and so on, effectively reversing the alphabet. Here is the Atbash substitution table:
```
Plain:  abcdefghijklmnopqrstuvwxyz
Cipher: ZYXWVUTSRQPONMLKJIHGFEDCBA
```
Amusingly, some English words Atbash into their own reverses, e.g., "wizard" = "draziw."
This is not considered a strong cipher but was at the time.

## Input Description
For this challenge you'll be asked to implement the Atbash cipher and encode (or decode) some English language words. If the character is NOT part of the English alphabet (a-z), you can keep the symbol intact. Examples:

```
foobar
wizard
/r/dailyprogrammer
gsrh rh zm vcznkov lu gsv zgyzhs xrksvi
```

## Output Description
Your program should emit the following strings as ciphertext or plaintext:
```
ullyzi
draziw
/i/wzrobkiltiznnvi
this is an example of the atbash cipher
```

## Solution

```elixir
iex> inputs = ["foobar", "wizard", "/r/dailyprogrammer", "gsrh rh zm vcznkov lu gsv zgyzhs xrksvi"]
["foobar", "wizard", "/r/dailyprogrammer",
 "gsrh rh zm vcznkov lu gsv zgyzhs xrksvi"]
iex> inputs |> Enum.map(&Atbash.process(&1))
["ullyzi", "draziw", "/i/wzrobkiltiznnvi",
 "this is an example of the atbash cipher"]
```