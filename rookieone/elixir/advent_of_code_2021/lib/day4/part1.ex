defmodule AdventOfCode2021.Day4.Part1 do
  @moduledoc """
  Documentation Day 4 Part 1 of Advent of Code
  """

  def solve(%{numbers: numbers, boards: boards}) do
    boards =
      for number <- numbers, reduce: boards do
        boards ->
          if any_winners?(boards) do
            boards
          else
            mark_boards(boards, number)
          end
      end

    case Enum.filter(boards, &(&1.winner == true)) do
      [winning_board] ->
        {:ok, winning_board}
    end
  end

  def any_winners?(boards) do
    Enum.any?(boards, &(&1.winner == true))
  end

  def mark_boards(boards, number) do
    for board <- boards do
      marked_board_rows =
        for row <- board.rows do
          for cell <- row do
            if cell.number == number do
              Map.put(cell, :marked, true)
            else
              cell
            end
          end
        end

      maybe_mark_board_as_winner(marked_board_rows, number)
    end
  end

  def maybe_mark_board_as_winner(marked_board_rows, number) do
    if any_horizontal_row_marked?(marked_board_rows) ||
         any_vertical_row_marked?(marked_board_rows) do
      %{
        winner: true,
        rows: marked_board_rows,
        score: score_board(marked_board_rows, number)
      }
    else
      %{
        winner: false,
        rows: marked_board_rows
      }
    end
  end

  def any_horizontal_row_marked?(rows) do
    Enum.any?(rows, fn row ->
      Enum.all?(row, &(&1.marked == true))
    end)
  end

  def any_vertical_row_marked?(rows) do
    [row | _tail] = rows
    max_col_index = length(row) - 1

    Enum.any?(0..max_col_index, fn col ->
      Enum.all?(rows, fn row ->
        Enum.at(row, col).marked == true
      end)
    end)
  end

  def debug_boards(boards) do
    Enum.map(boards, &debug_board/1)
  end

  def debug_board(board) do
    IO.inspect("======= begin winner? #{board.winner}")

    for row <- board.rows do
      output_row =
        for cell <- row, reduce: "" do
          output_string ->
            if cell.marked do
              output_string <> " #{cell.number}X"
            else
              output_string <> " #{cell.number} "
            end
        end

      IO.inspect(output_row)
    end

    IO.inspect("======= end")
  end

  def score_board(rows, number) do
    unmarked_numbers =
      for row <- rows, cell <- row, !cell.marked do
        cell.number
      end

    unmarked_numbers_sum = Enum.sum(unmarked_numbers)

    unmarked_numbers_sum * number
  end
end
