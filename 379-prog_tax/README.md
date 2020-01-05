# ProgTax

This a response to Daily Programmer #379:
https://reddit.com/r/dailyprogrammer/comments/cdieag/20190715_challenge_379_easy_progressive_taxation/

## Challenge

The nation of Examplania has the following income tax brackets:

| !income cap | !marginal tax rate |
| ----------- | ------------------ |
| 10_000      | 0.00 (0%)          |
| 30_000      | 0.10 (10%)         |
| 100_000     | 0.25 (25%)         |
| --          | 0.40 (40%)         |

Given a whole number up to 100_000_000, find the amount of tax owed in Examplania. Round down to a whole number.

## Examples

```
tax(0) => 0
tax(10_000) => 0
tax(10_009) => 0
tax(10_010) => 1
tax(12_000) => 200
tax(56_789) => 8_697
tax(1_234_567) => 473_326
```

## Optional improvement
