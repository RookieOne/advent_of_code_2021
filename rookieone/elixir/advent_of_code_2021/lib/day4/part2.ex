defmodule AdventOfCode2021.Day4.Part2 do
  @moduledoc """
  Documentation Day 4 Part 2 of Advent of Code
  """

  def solve(%{numbers: numbers, boards: boards}) do
    boards =
      for {number, index} <- Enum.with_index(numbers), reduce: boards do
        boards ->
          mark_boards(boards, number, index)
      end

    [last_to_win_board | _boards] =
      boards
      |> Enum.sort_by(& &1.winning_turn)
      |> Enum.reverse()

    {:ok, last_to_win_board}
  end

  def found_last_winner?(boards) do
    case Enum.group_by(boards, &(&1.winner == true), & &1.winner) do
      %{false => [_board]} -> true
      _ -> false
    end
  end

  def mark_boards(boards, number, index) do
    for board <- boards do
      if board.winner do
        board
      else
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

        maybe_mark_board_as_winner(marked_board_rows, number, index)
      end
    end
  end

  def maybe_mark_board_as_winner(marked_board_rows, number, index) do
    if any_horizontal_row_marked?(marked_board_rows) ||
         any_vertical_row_marked?(marked_board_rows) do
      %{
        winner: true,
        rows: marked_board_rows,
        winning_turn: index,
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
