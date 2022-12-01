#!/usr/bin/env elixir
defmodule Day1 do
  def top(acc, item) do
    if item > acc do
      item
    else
      acc
    end
  end

  def chunked(lines) do
    Enum.chunk_while(
      lines,
      {0, 0},
      fn elem, {max, curr} ->
        case Integer.parse(elem) do
          {x, _} -> {:cont, {max, curr + x}}
          :error -> {:cont, {top(max, curr), 0}}
        end
      end,
      fn
        {max, curr} -> {:cont, top(max, curr), {0, 0}}
      end
    )
  end
end

IO.read(:stdio, :all)
|> String.split("\n")
|> Day1.chunked()
|> List.first()
|> IO.puts()
