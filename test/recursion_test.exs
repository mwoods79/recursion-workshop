defmodule RecursionTest do
  use ExUnit.Case
  import Recursion

  test "boolean logic (not)" do
    assert b_not(true) == false
    assert b_not(false) == true
  end

  test "boolean logic (or)" do
    assert b_or(true, false) == true
    assert b_or(false, true) == true
    assert b_or(false, false) == false
  end

  test "boolean logic (and)" do
    assert b_and(true, true) == true
    assert b_and(false, true) == false
    assert b_and(true, false) == false
    assert b_and(false, false) == false
  end

  test "count" do
    assert count(["a", "b", "c"]) == 3
  end

  test "maximum" do
    list = [5, 4, 9, 2, 7]
    assert maximum(list) == 9
  end

  test "remove dups" do
    list = [1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 5]
    assert remove_dups(list) == [1, 2, 3, 4, 5]
  end

  test "zip" do
    assert zip([], [1, 2, 3]) == []
    assert zip([1, 2, 3], []) == []
    assert zip([1, 2, 3], [1, 2, 3]) == [{1, 1}, {2, 2}, {3, 3}]
    assert zip([1, 2, 3], [1, 2, 3, 4]) == [{1, 1}, {2, 2}, {3, 3}]
  end

  test "reduce" do
    assert reduce([1, 2, 3], 0, fn x, total -> x + total end) == 6
  end

  test "reduce (helper)" do
    assert reduce([1, 2, 3], fn x, total -> x + total end) == 6
  end

  test "foldl" do
    assert foldl([1, 2, 3], 0, fn x, total -> x + total end) == 6
  end

  test "map" do
    assert map([1, 2, 3], fn x -> x * 2 end) == [2, 4, 6]
  end

  test "filter" do
    assert filter([1, 2, 3, 4], fn x -> rem(x, 2) == 0 end) == [2, 4]
  end

  test "quicksort" do
    list = [8, 2, 5, 3, 5, 1, 9, 0, 6, 5]
    assert quicksort(list) == [0, 1, 2, 3, 5, 5, 5, 6, 8, 9]
  end
end
