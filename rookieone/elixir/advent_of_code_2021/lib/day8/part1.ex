defmodule AdventOfCode2021.Day8.Part1 do
  @moduledoc """
  Documentation Day 8 Part 1 of Advent of Code
  """

  def solve(input) do
    count =
      for line <- input, reduce: 0 do
        count ->
          input =
            line
            |> decipher_numbers()

          line_count =
            input.deciphered_digits
            |> Enum.filter(& &1)
            |> length()

          count + line_count
      end

    {:ok, count}
  end

  def decipher_numbers(input) do
    deciphered_digits =
      for digit <- input.digits do
        case String.length(digit) do
          2 -> 1
          3 -> 7
          4 -> 4
          7 -> 8
          _ -> nil
        end
      end

    Map.put(input, :deciphered_digits, deciphered_digits)
  end
end
