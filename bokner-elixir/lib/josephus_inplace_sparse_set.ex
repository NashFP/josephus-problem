defmodule Josephus.InPlace.SparseSet do
  @moduledoc """
  Use SparseSet to represent the circle.

  Usage: Josephus.InPlace.SparseSet.solve(n_soldiers, every_k)
  For instance:
  iex(1)> Josephus.InPlace.SparseSet.solve(41, 3)
  [31, 16, 35, 4, 22, 2, 25, 11, 38, 29, 17, 8, 40, 34, 26, 20, 13, 7, 41, 37, 32,
  28, 23, 19, 14, 10, 5, 1, 39, 36, 33, 30, 27, 24, 21, 18, 15, 12, 9, 6, 3]

  The survivor will be the first in the list
  """
  alias InPlace.SparseSet

  def solve(num_soldiers, every_k) do
    circle = SparseSet.new(num_soldiers)
    solve_impl(circle, num_soldiers, every_k)
  end

  def solve_impl(circle, n, k) do
    Enum.reduce_while(1..n, 0, fn _, position ->
        next_to_kill = next(circle, position, k)
        SparseSet.delete(circle, next_to_kill)
        {:cont, next_to_kill}
    end)

    to_solution(circle)
  end

  def next(_circle, pos, 0), do: pos

  ## walk around (reduced) circle and count
  def next(circle, pos, round_count) do
    next_p =
      if pos == circle.max_size do
        1
      else
        pos + 1
      end

    round_count =
      if SparseSet.member?(circle, next_p) do
        round_count - 1
      else
        round_count
      end

    next(circle, next_p, round_count)
  end

  defp to_solution(circle) do
    ## Get the final permutation
    InPlace.Array.to_list(circle.dom)
  end
end
