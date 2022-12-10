#!/usr/bin/env elixir
defmodule Day8 do
  # we can walk the row/cols from each direction
  # top, bottom, left, right (nsew)
  # track the tallest tree in that direction, then mark
  # which would be visible in that way
  # "visible trees" are taller than the tallest in any one direction
  # %{{r,c}: {:north, :south, :east, :west}}

  def answer(input) do
    rows =
      input
      |> Enum.with_index(fn line, row ->
        {row, line |> String.to_charlist() |> Enum.with_index(&{&2, &1 - ?0})}
      end)

    nrows = length(rows)
    ncols = length(elem(List.first(rows), 1))

    grid =
      rows
      |> Enum.flat_map(fn {row, values} ->
        values |> Enum.map(fn {col, val} -> {{row, col}, val} end)
      end)
      |> Map.new()

    north =
      0..(nrows - 1)//1
      |> Enum.flat_map(fn row ->
        Enum.map(
          0..(ncols - 1)//1,
          &{{row, &1}, {row - 1, &1}}
        )
      end)

    south =
      (nrows - 1)..0//-1
      |> Enum.flat_map(fn row ->
        Enum.map(
          0..(ncols - 1)//1,
          &{{row, &1}, {row + 1, &1}}
        )
      end)

    west =
      0..(nrows - 1)//1
      |> Enum.flat_map(fn row ->
        Enum.map(
          0..(ncols - 1)//1,
          &{{row, &1}, {row, &1 - 1}}
        )
      end)

    east =
      0..(nrows - 1)//1
      |> Enum.flat_map(fn row ->
        Enum.map(
          (ncols - 1)..0//-1,
          &{{row, &1}, {row, &1 + 1}}
        )
      end)

    dirs =
      [north, south, east, west]
      |> Enum.map(fn keys ->
        Enum.reduce(keys, %{}, fn {dst, src}, acc ->
          cond do
            Map.has_key?(acc, src) ->
              Map.put(acc, dst, max(grid[src], acc[src]))

            true ->
              Map.put(acc, dst, -1)
          end
        end)
      end)

    Map.to_list(grid)
    |> Enum.count(fn {k, v} ->
      sides = dirs |> Enum.map(& &1[k])
      taller = sides |> Enum.any?(fn x -> v > x end)
      taller
    end)
  end
end

IO.read(:stdio, :all)
|> String.split("\n")
|> Enum.filter(fn line -> String.length(line) != 0 end)
|> Day8.answer()
|> IO.inspect()
