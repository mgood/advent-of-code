#!/usr/bin/env elixir
defmodule Day4 do
  def parse_range(r) do
    [a, b] = Enum.map(String.split(r, "-"), fn i -> String.to_integer(i) end)
    {a, b}
  end

  def parse_line(line) do
    Enum.map(String.split(line, ","), &parse_range/1)
  end

  def overlap({a, b}, {c, d}) do
    (a <= c && c <= b) || (c <= a && a <= d)
  end

  def answer(lines) do
    vals =
      Enum.map(
        lines,
        &parse_line/1
      )

    Enum.count(vals, fn [x, y] -> overlap(x, y) end)
  end
end

IO.read(:stdio, :all)
|> String.split("\n")
|> Enum.filter(fn line -> String.length(line) != 0 end)
|> Day4.answer()
|> IO.inspect()
