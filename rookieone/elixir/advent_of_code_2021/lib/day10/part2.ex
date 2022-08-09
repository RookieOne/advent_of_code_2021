defmodule AdventOfCode2021.Day10.Part2 do
  @moduledoc """
  Documentation Day 10 Part 2 of Advent of Code
  """

  def solve(inputs) do
    scores =
      for input <- inputs do
        case evaluate_line(input, []) do
          :ok ->
            0

          {:error, :corrupted} ->
            0

          {:error, :incomplete, open_symbols: open_symbols} ->
            Enum.reduce(open_symbols, 0, fn symbol, sum ->
              sum * 5 + score(symbol)
            end)
        end
      end
      |> Enum.reject(&(&1 == 0))
      |> Enum.sort()

    middle_index = round(length(scores) / 2) - 1
    middle_score = Enum.at(scores, middle_index)

    {:ok, middle_score}
  end

  def evaluate_line([], []) do
    :ok
  end

  def evaluate_line([], open_symbols) do
    {:error, :incomplete, open_symbols: open_symbols}
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
        {:error, :corrupted}
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
  ): 1 point.
  ]: 2 points.
  }: 3 points.
  >: 4 points.
  """
  def score("("), do: 1
  def score("["), do: 2
  def score("{"), do: 3
  def score("<"), do: 4
end
