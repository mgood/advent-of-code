#!/usr/bin/env elixir
defmodule Day5 do
  def parse_stack_line(line) do
    case line do
      <<
        "[",
        lett::binary-size(1),
        "] "
      >> <> rest ->
        [[lett] | parse_stack_line(rest)]

      "    " <> rest ->
        [[] | parse_stack_line(rest)]

      "" ->
        []

      rest ->
        {:error, rest}
    end
  end

  def move(stacks, n, from, to) do
    head = Enum.at(stacks, from) |> Enum.take(n)
    stacks = List.update_at(stacks, from, &Enum.drop(&1, n))
    stacks = List.update_at(stacks, to, &(head ++ &1))
    stacks
  end

  def answer(lines) do
    {stacks, [_, "" | instructions]} =
      lines |> Enum.split_while(fn x -> !String.starts_with?(x, " 1 ") end)

    start =
      stacks
      |> Enum.map(&parse_stack_line(&1 <> " "))
      |> Enum.zip()
      |> Enum.map(&(Tuple.to_list(&1) |> List.flatten()))

    result =
      Enum.reduce(
        instructions,
        start,
        fn elem, stacks ->
          case elem do
            "" ->
              stacks

            <<"move ", n::binary-size(2), " from ", from::binary-size(1), " to ",
              to::binary-size(1)>> ->
              move(
                stacks,
                String.to_integer(n),
                String.to_integer(from) - 1,
                String.to_integer(to) - 1
              )

            <<"move ", n::binary-size(1), " from ", from::binary-size(1), " to ",
              to::binary-size(1)>> ->
              move(
                stacks,
                String.to_integer(n),
                String.to_integer(from) - 1,
                String.to_integer(to) - 1
              )
          end
        end
      )

    result |> Enum.map(&List.first/1) |> Enum.join("")
  end
end

IO.read(:stdio, :all)
|> String.split("\n")
|> Day5.answer()
|> IO.inspect()
