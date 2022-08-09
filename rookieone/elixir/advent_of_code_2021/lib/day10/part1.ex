defmodule AdventOfCode2021.Day10.Part1 do
  @moduledoc """
  Documentation Day 10 Part 1 of Advent of Code
  """

  def solve(inputs) do
    score =
      for input <- inputs do
        case evaluate_line(input, []) do
          :ok ->
            0

          {:error, :corrupted, score: score} ->
            score
        end
      end
      |> Enum.sum()

    {:ok, score}
  end

  def evaluate_line([], []) do
    :ok
  end

  def evaluate_line([], _open_symbols) do
    :ok
  end

  def evaluate_line(
        [symbol | symbols],
        open_chunk_symbols = [last_open_chunk_symbol | other_symbols]
      ) do
    cond do
      close_match?(last_open_chunk_symbol, symbol) ->
        evaluate_line(symbols, other_symbols)

      opening_symbol?(symbol) ->
        evaluate_line(symbols, [symbol | open_chunk_symbols])

      true ->
        {:error, :corrupted, score: score(symbol)}
    end
  end

  def evaluate_line([symbol | symbols], []) do
    evaluate_line(symbols, [symbol])
  end

  @doc """
  If a chunk opens with (, it must close with ).
  If a chunk opens with [, it must close with ].
  If a chunk opens with {, it must close with }.
  If a chunk opens with <, it must close with >.
  """
  def close_match?("(", ")"), do: true
  def close_match?("[", "]"), do: true
  def close_match?("{", "}"), do: true
  def close_match?("<", ">"), do: true
  def close_match?(_symbol, _other_symbol), do: false

  def opening_symbol?("("), do: true
  def opening_symbol?("["), do: true
  def opening_symbol?("{"), do: true
  def opening_symbol?("<"), do: true
  def opening_symbol?(_symbol), do: false

  @doc """
  ): 3 points.
  ]: 57 points.
  }: 1197 points.
  >: 25137 points.
  """
  def score(")"), do: 3
  def score("]"), do: 57
  def score("}"), do: 1_197
  def score(">"), do: 25_137
end
