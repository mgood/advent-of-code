#!/usr/bin/env elixir
defmodule Day1 do
  def top(acc, item) do
    case acc do
      {a, b, _c} when item > a ->
        {item, a, b}

      {a, b, _c} when item > b ->
        {a, item, b}

      {a, b, c} when item > c ->
        {a, b, item}

      _ ->
        acc
    end
  end

  def reduced(lines) do
    {max, _} =
      Enum.reduce(
        lines,
        {{0, 0, 0}, 0},
        fn elem, {max, curr} ->
          case Integer.parse(elem) do
            {x, _} -> {max, curr + x}
            :error -> {top(max, curr), 0}
          end
        end
      )

    Tuple.sum(max)
  end
end

IO.read(:stdio, :all)
|> String.split("\n")
|> Day1.reduced()
|> IO.puts()
