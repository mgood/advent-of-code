#!/usr/bin/env elixir
defmodule Day1 do
  def best([head | tail], max, curr) do
    case Integer.parse(head) do
      {x, _} -> best(tail, max, curr + x)
      :error when curr > max -> best(tail, curr, 0)
      :error -> best(tail, max, 0)
    end
  end

  def best([], max, _curr) do
    max
  end
end

IO.read(:stdio, :all)
|> String.split("\n")
|> Day1.best(0, 0)
|> IO.puts()
