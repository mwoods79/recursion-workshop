defmodule Recursion do
  @moduledoc """
  Recursion Intro Workshop
  """

  def b_not(true), do: false
  def b_not(false), do: true

  def b_or(true, _false), do: true
  def b_or(_true, true), do: true
  def b_or(_first, _second), do: false

  def b_and(true, true), do: true
  def b_and(_first, _second), do: false

  def count([]), do: 0
  def count([_h | t]), do: 1 + count(t)

  def maximum([h]), do: h

  def maximum([h | tail]) do
    max(h, maximum(tail))
  end

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

  def zip(_, []), do: []
  def zip([], _), do: []
  def zip([h1 | t1], [h2 | t2]), do: [{h1, h2} | zip(t1, t2)]

  def reduce([], init, _fun), do: init
  def reduce([head | tail], init, fun), do: fun.(head, reduce(tail, init, fun))

  def reduce([head | tail], fun) do
    reduce(tail, head, fun)
  end

  def foldl([], init, _fun), do: init
  def foldl([head | tail], init, fun), do: foldl(tail, fun.(init, head), fun)

  def map(list, fun) do
    reduce(list, [], fn x, acc -> [fun.(x) | acc] end)
  end

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

  def quicksort([]), do: []

  def quicksort([pivot | rest]) do
    lesser = filter(rest, fn i -> i <= pivot end)
    greater = filter(rest, fn i -> i > pivot end)
    quicksort(lesser) ++ [pivot] ++ quicksort(greater)
  end
end
