#!/usr/bin/env elixir
defmodule Day3 do
  def priority(chars) do
    Enum.map(
      String.to_charlist(chars),
      fn
        x when x in ?a..?z -> x - ?a + 1
        x when x in ?A..?Z -> x - ?A + 27
        _ -> :error
      end
    )
  end

  def shared(vals) do
    n = div(length(vals), 2)

    if n == 0 do
      []
    else
      [a, b] = Enum.chunk_every(vals, n)

      common =
        MapSet.intersection(
          MapSet.new(a),
          MapSet.new(b)
        )

      MapSet.to_list(common)
    end
  end

  def answer(lines) do
    vals =
      Enum.map(
        lines,
        fn line -> line |> priority() |> shared() end
      )

    Enum.sum(List.flatten(vals))
  end
end

IO.read(:stdio, :all)
|> String.split("\n")
|> Day3.answer()
|> IO.inspect()
