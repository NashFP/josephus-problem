defmodule Josephus.InPlace.SparseSet do
  @moduledoc """
  Functional version.
  Usage: Josephus.InPlace.solve(n_soldiers, every_k)
  For instance:
  iex(1)> Josephus.InPlace.solve(41, 3)

  The survivor will be the first in the list
  """
  alias InPlace.SparseSet

  def solve(num_soldiers, every_k) do
    circle = SparseSet.new(num_soldiers)
    solve_impl(circle, every_k, 0, [])
  end

  def solve_impl(circle, k, position, acc) do
    if SparseSet.empty?(circle) do
      acc
    else
      next_to_kill = next(circle, position, k)
      SparseSet.delete(circle, next_to_kill)
      solve_impl(circle, k, next_to_kill, [next_to_kill | acc])
    end
  end

  def next(_circle, pos, 0), do: pos

  def next(circle, pos, moves_left) do
    next_p =
      if pos == circle.max_size do
        1
      else
        pos + 1
      end

    moves_left =
      if SparseSet.member?(circle, next_p) do
        moves_left - 1
      else
        moves_left
      end

    next(circle, next_p, moves_left)
  end
end
