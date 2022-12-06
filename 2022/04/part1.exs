#!/usr/bin/env elixir
defmodule Day4 do
  def parse_range(r) do
    [a, b] = Enum.map(String.split(r, "-"), fn i -> String.to_integer(i) end)
    {a, b}
  end

  def parse_line(line) do
    Enum.map(String.split(line, ","), &parse_range/1)
  end

  def contains({a, b}, {c, d}) do
    (a <= c && d <= b) || (c <= a && b <= d)
  end

  def answer(lines) do
    vals =
      Enum.map(
        lines,
        &parse_line/1
      )

    Enum.count(vals, fn [x, y] -> contains(x, y) end)
  end
end

IO.read(:stdio, :all)
|> String.split("\n")
|> Enum.filter(fn line -> String.length(line) != 0 end)
|> Day4.answer()
|> IO.inspect()
