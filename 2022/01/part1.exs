#!/usr/bin/env elixir
defmodule Day1 do
  def top(acc, item) do
    if item > acc do
      item
    else
      acc
    end
  end

  def reduced(lines) do
    {max, _} =
      Enum.reduce(
        lines,
        {0, 0},
        fn elem, {max, curr} ->
          case Integer.parse(elem) do
            {x, _} -> {max, curr + x}
            :error -> {top(max, curr), 0}
          end
        end
      )

    max
  end
end

IO.read(:stdio, :all)
|> String.split("\n")
|> Day1.reduced()
|> IO.puts()
