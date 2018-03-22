# HELLO

---

## Before we start

Why are we doing this?

---

## Excercise

Use `iex` like a calculator:

```elixir
iex> 1 + 1
2
iex> :math.pos(1000, 3)
1.0e9
```

HINT:

```
brew install elixir
```

---

## Thinking recursively

In order to understand recursion you must first understand recursion.

```elixir
def factorial(0), do: 1
def factorial(n) when is_integer(n) and n > 0 do
  n * factorial(n-1)
end
```

---

## Obligitory quicksort

```elixir
def quicksort([]), do: []
def quicksort([pivot | rest]) do
  lesser  = filter(rest, fn i -> i <= pivot end)
  greater = filter(rest, fn i -> i >  pivot end)
  quicksort(lesser) ++ [pivot] ++ quicksort(greater)
end
```

---

## Excercise
* Create a mix project 

```
mix new recursion
```

---

## Excercise
* Implement boolean logic
* Simple pattern matching, no recursion

```elixir
b_not(true) # => false
b_or(true, false) # => true
b_and(true, false) # => false
```

---

## Excercise
* Write a function that finds the length of a list

---
## SOLUTION

```
def count([]), do: 0
def count([_h | t]), do: 1 + count(t)
```

---

## How it works

```elixir
count(["a", "b", "c"])
# => 1 + count(["b", "c"])
# => 1 + 1 + count(["c"])
# => 1 + 1 + 1 + count([])
# => 1 + 1 + 1 + 0
# => 3
```

---

## Excercise

* Write a function that finds the maximum value in a list

HINT: 
```elixir
max(5, 9) # => 9
```

---
## SOLUTION

```
def maximum([h]), do: h
def maximum([h | tail]) do
  max(h, maximum(tail))
end
```

---

## How it works

```elixir
maximum([1, 9, 7])
# => max(1, maximum([9, 7]))
# => max(1, max(9, maximum([7]))
# => max(1, max(9, 7))
# => max(1, 9)
# => 9 
```

---

## Excercise
* Write a function that removes all duplicates

---

## SOLUTION

```
def remove_dups(list) when is_list(list) do
  remove_dups(list, [])
end

defp remove_dups([h | t1], [h | _t2] = acc) do
  remove_dups(t1, acc)
end

defp remove_dups([h | t], acc) do
  remove_dups(t, [h | acc])
end

defp remove_dups([], acc) do
  Enum.reverse(acc)
end
```

---

## Excercise
* Write a zip function

---

## SOLUTION

```
def zip(_, []), do: []
def zip([], _), do: []
def zip([h1 | t1], [h2 | t2]), do: [{h1, h2} | zip(t1, t2)]
```

---

## Excercise
* Write a reduce function

---

## SOLUTION

```
def reduce([], init, _fun), do: init
def reduce([head | tail], init, fun) do
  fun.(head, reduce(tail, init, fun))
end
```

---

## How it works

```elixir
reduce([1, 2, 3], 0, fn x, y -> "(#{x}+#{y})" end)
# => "(1+(2+(3+0)))"
```

---

## Excercise
* Write a foldl function

---

## SOLUTION

```
def foldl([], init, _fun), do: init
def foldl([head | tail], init, fun) do
  foldl(tail, fun.(init, head), fun)
end
```

---

## How it works

```elixir
foldl([1, 2, 3], 0, fn x, y -> "(#{x}+#{y})" end)
# => "(((0+1)+2)+3)"
```

---

## Excercise
* Write a reduce helper function

---

## SOLUTION

```
def reduce([head | tail], fun) do
  reduce(tail, head, fun)
end
```

---
## Excercise
* Write a map function

---

## SOLUTION

```
def map(list, fun) do
  reduce(list, [], fn x, acc -> [fun.(x) | acc] end)
end
```

---

## Excercise
* Write a filter function

---

## SOLUTION

```
def filter(list, fun) when is_list(list) do
  filter_fun = fn x, acc ->
    if fun.(x) do
      [x | acc]
    else
      acc
    end
  end

  reduce(list, [], filter_fun)
end
```

---

## Now we can quicksort

```elixir
def quicksort([]), do: []
def quicksort([pivot | rest]) do
  lesser  = filter(rest, fn i -> i <= pivot end)
  greater = filter(rest, fn i -> i >  pivot end)
  quicksort(lesser) ++ [pivot] ++ quicksort(greater)
end
```
