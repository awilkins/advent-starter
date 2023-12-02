# Advent of Code

## Python

I use Python for Advent ; it's good with lists, and processing lists is a key
task in a LOT of advent problems.

Some of the most useful Python features for doing Advent puzzles fast :

- List comprehensions
  - e.g. "a list of integers for each one of these numeric strings" or
```python
numeric_strings = [ '1', '3', '5', '7' ]
# Longhand way
slow_numbers = []
for number_string in numeric_strings:
  slow_numbers.append(int(number_string))
# Fast way
numbers = [int(numeric) for numeric in numeric_strings]
# Same results
print (slow_numbers, numbers)
[1, 3, 5, 7] [1, 3, 5, 7]
```
- Functions that do things with lists or iterables like `sum()`
```python
total = sum(numbers)
print(total)
16
```
- [`itertools`](https://docs.python.org/3/library/itertools.html)

## General

### `makeday.sh`

Why bother with all that tedious writing of boilerplate? The Advent format is
pretty predictable and hasn't changed in years.

- You'll have to write two `answer` functions
- You'll be working with an input file

So this script creates some code from templates and grabs the input for you.

For this you'll need your session token for Advent of Code, which you can grab
from your browser session - after you've logged in, it will be in your cookies
each time you make a page request, so bash F12 and go to the network tab and
find it - it's the part in the "session" key of the cookie (which I've blurred
out here, because it's MY session key).

![image](https://github.com/awilkins/advent-starter/assets/368399/a9392fd7-e2c0-4d1e-aeca-36ed8dddad65)

Export this to your environment as `AOC_TOKEN` ; I have
[`direnv`](https://direnv.net/) installed to do this for me.

### `util.py`

The templates call functions in this module, which loads the `input.txt` and
presents it as a list of lines.
