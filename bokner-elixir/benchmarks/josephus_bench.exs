Mix.install(
  [
    {:benchee, "~> 1.0"},
    {:josephus, path: ".", app: false}
  ]
)

Benchee.run(
  %{
    "functional" => fn {num_soldiers, every_k} = _input ->
      Josephus.Functional.solve(num_soldiers, every_k)
    end,
    "inplace_linked_list" => fn {num_soldiers, every_k} = _input ->
      Josephus.InPlace.LinkedList.solve(num_soldiers, every_k)
    end,
    "inplace_sparse_set" => fn {num_soldiers, every_k} = _input ->
      Josephus.InPlace.SparseSet.solve(num_soldiers, every_k)
    end,


  },
  inputs: %{
    "original_story" => {41, 3},
    "small" => {1_000, 5},
    "medium" => {10_000, 5},
    "large" => {100_000, 5}
  },

  formatters: [
    {Benchee.Formatters.Console, extended_statistics: true}
  ]
)
