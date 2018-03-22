defmodule Recursion do
  @moduledoc """
  Recursion Intro Workshop
  """

  def b_not(true), do: false
  def b_not(false), do: true

  def count([]), do: 0
  def count([_h | t]), do: 1 + count(t)
end
