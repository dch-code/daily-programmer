https://www.reddit.com/r/dailyprogrammer/comments/35l5eo/20150511_challenge_214_easy_calculating_the/

## Description

**Standard deviation** is one of the most basic measurments in statistics. For some collection of values (known as a "population" in statistics), it measures how dispersed those values are. If the standard deviation is high, it means that the values in the population are very spread out; if it's low, it means that the values are tightly clustered around the mean value.

For today's challenge, you will get a list of numbers as input which will serve as your statistical population, and you are then going to calculate the standard deviation of that population. There are statistical packages for many programming languages that can do this for you, but you are highly encouraged not to use them: the spirit of today's challenge is to implement the standard deviation function yourself.

The following steps describe how to calculate standard deviation for a collection of numbers. For this example, we will use the following values:


```
5 6 11 13 19 20 25 26 28 37
```

1. First, calculate the average (or mean) of all your values, which is defined as the sum of all the values divided by the total number of values in the population. For our example, the sum of the values is 190 and since there are 10 different values, the mean value is 190/10 = 19
2. Next, for each value in the population, calculate the difference between it and the mean value, and square that difference. So, in our example, the first value is 5 and the mean 19, so you calculate (5 - 19)2 which is equal to 196. For the second value (which is 6), you calculate (6 - 19)2 which is equal to 169, and so on.
3. Calculate the sum of all the values from the previous step. For our example, it will be equal to 196 + 169 + 64 + ... = 956.
4. Divide that sum by the number of values in your population. The result is known as the variance of the population, and is equal to the square of the standard deviation. For our example, the number of values in the population is 10, so the variance is equal to 956/10 = 95.6.
5. Finally, to get standard deviation, take the square root of the variance. For our example, sqrt(95.6) ≈ 9.7775.
 
## Formal inputs & outputs
## Input
The input will consist of a single line of numbers separated by spaces. The numbers will all be positive integers.
## Output
Your output should consist of a single line with the standard deviation rounded off to at most 4 digits after the decimal point.

## Sample inputs & outputs
Input 1
```
5 6 11 13 19 20 25 26 28 37
```
Output 1
```
9.7775
```
Input 2
```
37 81 86 91 97 108 109 112 112 114 115 117 121 123 141
```
Output 2
```
23.2908
```

## Notes
For you statistics nerds out there, note that this is the population standard deviation, not the sample standard deviation. We are, after all, given the entire population and not just a sample.


## Solution
```
# instantiate a list
iex> input1 = [5, 6, 11, 13, 19, 20, 25, 26, 28, 37]
[5, 6, 11, 13, 19, 20, 25, 26, 28, 37]

# you can find it's average/mean
iex> Stdev.average(input1)
19.0

# or find the distance from the mean for each element in the list
iex> Stdev.diffs(input1)  
[-14.0, -13.0, -8.0, -6.0, 0.0, 1.0, 6.0, 7.0, 9.0, 18.0]

# an intermediate step to square each distance from the mean
iex> Stdev.diffs(input1) |> Stdev.diffs_squared
[196.0, 169.0, 64.0, 36.0, 0.0, 1.0, 36.0, 49.0, 81.0, 324.0]

# or just calculate the variance directly
iex> Stdev.variance(input1)                    
95.6

# and of course you can just calculate the standard deviation of a list directly
iex> Stdev.stdev(input1)
9.777525249264253
```

```
iex> input2 = [37, 81, 86, 91, 97, 108, 109, 112, 112, 114, 115, 117, 121, 123, 141]
[37, 81, 86, 91, 97, 108, 109, 112, 112, 114, 115, 117, 121, 123, 141]
 
iex> Stdev.stdev(input2)
23.29081841031401
```