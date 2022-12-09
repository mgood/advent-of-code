#!/usr/bin/env elixir
defmodule Day7 do
  defmodule Dir do
    defstruct [:size, :children]
  end

  def ls_size(lines) do
    case lines do
      [] ->
        {0, []}

      [head | rest] ->
        case head do
          "dir " <> _ ->
            ls_size(rest)

          "$ " <> _ ->
            {0, lines}

          "" ->
            {0, rest}

          file_size ->
            [size | _] = String.split(file_size, " ")
            {rsize, lines} = ls_size(rest)
            {String.to_integer(size) + rsize, lines}
        end
    end
  end

  def add_size(acc, path, size) do
    case path do
      [] ->
        Map.update(acc, :size, size, &(&1 + size))

      [head | rest] ->
        sub = Map.get(acc, head, %{})
        sub = add_size(sub, rest, size)
        Map.put(acc, head, sub)
    end
  end

  def sizes(lines, path, acc) do
    case lines do
      [] ->
        acc

      [head | rest] ->
        case head do
          "$ ls" ->
            {size, rest} = ls_size(rest)
            acc = add_size(acc, path, size)
            sizes(rest, path, acc)

          "$ cd .." ->
            {_, path} = List.pop_at(path, -1)
            sizes(rest, path, acc)

          "$ cd " <> dir ->
            sizes(rest, List.insert_at(path, -1, dir), acc)
        end
    end
  end

  def total_size(size) do
    size
    |> Map.to_list()
    |> Enum.reduce(
      %{},
      fn
        {:size, s}, acc ->
          Map.update(acc, :size, s, &(&1 + s))

        {k, v}, acc ->
          vtot = total_size(v)
          s = vtot[:size]
          acc = Map.update(acc, :size, s, &(&1 + s))
          Map.put(acc, k, vtot)
      end
    )
  end

  def flat_sizes(totals) do
    [
      totals[:size]
      | case map_size(totals) do
          1 ->
            []

          _ ->
            Map.delete(totals, :size) |> Map.values() |> Enum.flat_map(&flat_sizes/1)
        end
    ]
  end

  def answer(input) do
    ["$ cd /" | input] = input

    input
    |> sizes([], %{})
    |> total_size()
    |> flat_sizes()
    |> Enum.filter(&(&1 <= 100_000))
    |> Enum.sum()
  end
end

IO.read(:stdio, :all)
|> String.split("\n")
|> Day7.answer()
|> IO.inspect()
