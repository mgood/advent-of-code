#!/usr/bin/env elixir
defmodule Day2 do
  def symbol(c) do
    case c do
      "A" -> :rock
      "X" -> :rock
      "B" -> :paper
      "Y" -> :paper
      "C" -> :scissors
      "Z" -> :scissors
      _ -> :error
    end
  end

  def winner(left, right) do
    if left == right do
      :draw
    else
      case {left, right} do
        {:paper, :rock} -> :left
        {:rock, :scissors} -> :left
        {:scissors, :paper} -> :left
        _ -> :right
      end
    end
  end

  def score(left, right) do
    shape =
      case right do
        :rock -> 1
        :paper -> 2
        :scissors -> 3
      end

    result =
      case winner(left, right) do
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
            [left, right] -> score(symbol(left), symbol(right))
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
