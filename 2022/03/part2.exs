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

  def answer(lines) do
    groups =
      Enum.chunk_every(
        Enum.map(
          lines,
          fn line -> line |> priority() end
        ),
        3
      )

    vals =
      Enum.map(
        groups,
        fn
          [a, b, c] ->
            MapSet.to_list(
              MapSet.intersection(
                MapSet.intersection(MapSet.new(a), MapSet.new(b)),
                MapSet.new(c)
              )
            )

          [[]] ->
            []
        end
      )

    Enum.sum(List.flatten(vals))
  end
end

IO.read(:stdio, :all)
|> String.split("\n")
|> Day3.answer()
|> IO.inspect()
