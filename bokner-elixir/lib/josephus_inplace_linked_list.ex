defmodule Josephus.InPlace.LinkedList do
  @moduledoc """
  Use LinkedList to represent the circle.

  Usage: Josephus.InPlace.LinkedList.solve(n_soldiers, every_k)
  For instance:
  iex(1)> Josephus.InPlace.LinkedList.solve(41, 3)
  [31, 16, 35, 4, 22, 2, 25, 11, 38, 29, 17, 8, 40, 34, 26, 20, 13, 7, 41, 37, 32,
  28, 23, 19, 14, 10, 5, 1, 39, 36, 33, 30, 27, 24, 21, 18, 15, 12, 9, 6, 3]

  The survivor will be the first in the list
  """
  alias InPlace.LinkedList

  def solve(num_soldiers, every_k) do
    circle = LinkedList.new(num_soldiers)
    Enum.each(1..num_soldiers, fn n -> LinkedList.append(circle, n) end)

    {_move_count, kill_sequence} =
      LinkedList.iterate(
        circle,
        fn p, {count_acc, sequence_acc} ->
          sequence_acc =
            if rem(count_acc, every_k) == 0 do
              LinkedList.delete_pointer(circle, p)
              [p | sequence_acc]
            else
              sequence_acc
            end

          {count_acc + 1, sequence_acc}
        end,
        initial_value: {1, []},
        stop_on: fn _ -> LinkedList.empty?(circle) end
      )

    [_survivor | _killed] = kill_sequence
  end
end
