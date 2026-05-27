defmodule Josephus.Functional do
  @moduledoc """
  Functional version.
  Usage: Josephus.Functional.solve(n_soldiers, every_k)
  For instance:
  iex(1)> Josephus.Functional.solve(41, 3)
  """
  def solve(n, k) when k > 0 do
    do_permutation(Enum.to_list(1..n), k, [], 0)
  end

  defp do_permutation([], _k, acc, _idx), do: acc

  defp do_permutation(list, k, acc, idx) do
    len = length(list)
    kill_index = rem(idx + k - 1, len)

    {killed, rest} = List.pop_at(list, kill_index)
    do_permutation(rest, k, [killed | acc], kill_index)
  end
end
