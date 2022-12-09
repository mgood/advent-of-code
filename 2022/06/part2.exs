#!/usr/bin/env elixir
defmodule Day6 do
  def answer(input) do
    n = 14

    n +
      (input
       |> String.to_charlist()
       |> Enum.chunk_every(n, 1)
       |> Enum.find_index(&(MapSet.size(MapSet.new(&1)) == n)))
  end
end

IO.read(:stdio, :all)
|> Day6.answer()
|> IO.inspect()
