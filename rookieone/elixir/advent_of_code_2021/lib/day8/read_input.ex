defmodule AdventOfCode2021.Day8.ReadInput do
  @moduledoc """
  Read file for Day 8 of Advent of Code

  acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf
  """

  def read_file(path) do
    case File.read(path) do
      {:ok, contents} ->
        lines = String.split(contents, "\n")

        input =
          for line <- lines, line != "" do
            [all_patterns, all_digits] = String.split(line, " | ")

            patterns = String.split(all_patterns, " ")
            digits = String.split(all_digits, " ")

            %{
              patterns: patterns,
              digits: digits,
              maybe_keys: %{},
              decipher_keys: %{},
              deciphered_digits: []
            }
          end

        {:ok, input}
    end
  end
end
