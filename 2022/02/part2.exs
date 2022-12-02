#!/usr/bin/env elixir
defmodule Day2 do
  def symbol(c) do
    case c do
      "A" -> :rock
      "B" -> :paper
      "C" -> :scissors
      _ -> :error
    end
  end

  def result(c) do
    case c do
      "X" -> :left
      "Y" -> :draw
      "Z" -> :right
      _ -> :error
    end
  end

  def choice(left, outcome) do
    case {left, outcome} do
      {_, :draw} -> left
      {:paper, :right} -> :scissors
      {:paper, :left} -> :rock
      {:scissors, :right} -> :rock
      {:scissors, :left} -> :paper
      {:rock, :right} -> :paper
      {:rock, :left} -> :scissors
    end
  end

  def score(left, outcome) do
    shape =
      case choice(left, outcome) do
        :rock -> 1
        :paper -> 2
        :scissors -> 3
      end

    result =
      case outcome do
        :draw -> 3
        :right -> 6
        _ -> 0
      end

    shape + result
  end

  def answer(lines) do
    Enum.sum(
      Enum.map(
        lines,
        fn line ->
          case String.split(line) do
            [left, right] -> score(symbol(left), result(right))
            _ -> 0
          end
        end
      )
    )
  end
end

IO.read(:stdio, :all)
|> String.split("\n")
|> Day2.answer()
|> IO.puts()
