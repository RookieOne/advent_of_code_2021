defmodule AdventOfCode2021.Day8.Part2 do
  @moduledoc """
  Documentation Day 8 Part 2 of Advent of Code
  """

  def solve(input) do
    result =
      for line <- input, reduce: 0 do
        sum ->
          number_map =
            for pattern <- line.patterns, into: %{} do
              case String.length(pattern) do
                2 -> {"1", pattern}
                3 -> {"7", pattern}
                4 -> {"4", pattern}
                7 -> {"8", pattern}
                _ -> {nil, nil}
              end
            end
            |> Map.drop([nil])

          {_patterns, number_map} =
            {line.patterns, number_map}
            |> identify_pattern("0", length: 6, contain: ["1", "7"], does_not_contain: ["4", "8"])
            |> identify_pattern("9", length: 6, contain: ["1", "4", "7"], does_not_contain: ["8"])
            |> identify_pattern("6",
              length: 6,
              contain: [],
              does_not_contain: ["1", "4", "7", "8"]
            )
            |> identify_pattern("3",
              length: 5,
              contain: ["1", "7"],
              does_not_contain: ["0", "4", "8", "9"]
            )
            |> identify_pattern("3",
              length: 5,
              contain: ["1", "7"],
              does_not_contain: ["0", "4", "8", "9"]
            )
            |> identify_two()

          number_key_list =
            for {number, letters} <- number_map do
              %{
                number: number,
                letters: String.graphemes(letters)
              }
            end

          deciphered_digits =
            for digit <- line.digits do
              digit_letters = String.graphemes(digit)

              found =
                Enum.find(number_key_list, fn number_key ->
                  length(digit_letters) == length(number_key.letters) &&
                    Enum.all?(digit_letters, &Enum.member?(number_key.letters, &1))
                end)

              if found == nil do
                IO.inspect(line.patterns)
                IO.inspect(line.digits)
                IO.inspect(digit_letters, label: "digit_letters")
                IO.inspect(number_key_list, label: "number_key_list")
              end

              found.number
            end

          {number, _} =
            deciphered_digits
            |> Enum.join()
            |> Integer.parse()

          sum + number
      end

    {:ok, result}
  end

  def identify_pattern({patterns, number_map}, number,
        length: length,
        contain: contain_digits,
        does_not_contain: does_not_contain_digits
      ) do
    number_map =
      for pattern <- patterns, String.length(pattern) == length, reduce: number_map do
        number_map ->
          if does_pattern_match?(pattern, number_map,
               contain: contain_digits,
               does_not_contain: does_not_contain_digits
             ) do
            Map.put(number_map, number, pattern)
          else
            number_map
          end
      end

    {patterns, number_map}
  end

  def does_pattern_match?(pattern, number_map,
        contain: contain_digits,
        does_not_contain: does_not_contain_digits
      ) do
    contains_all_digits =
      for digit <- contain_digits do
        for letter <- String.graphemes(number_map[digit]) do
          String.contains?(pattern, letter)
        end
        |> Enum.all?()
      end
      |> Enum.all?()

    contains_any_unwanted_digits =
      for digit <- does_not_contain_digits do
        for letter <- String.graphemes(number_map[digit]) do
          String.contains?(pattern, letter)
        end
        |> Enum.all?()
      end
      |> Enum.any?()

    contains_all_digits && !contains_any_unwanted_digits
  end

  def identify_two({patterns, number_map}) do
    letters_in_six = MapSet.new(String.graphemes(number_map["6"]))
    letters_in_nine = MapSet.new(String.graphemes(number_map["9"]))

    [letter_that_six_has_that_nine_does_not] =
      letters_in_six
      |> MapSet.difference(letters_in_nine)
      |> MapSet.to_list()

    identified_patterns = Map.values(number_map)
    unidentified_patterns = Enum.reject(patterns, &Enum.member?(identified_patterns, &1))

    pattern_for_two =
      Enum.find(
        unidentified_patterns,
        &String.contains?(&1, letter_that_six_has_that_nine_does_not)
      )

    pattern_for_five =
      Enum.find(
        unidentified_patterns,
        &(!String.contains?(&1, letter_that_six_has_that_nine_does_not))
      )

    updated_number_map =
      Map.merge(number_map, %{
        "2" => pattern_for_two,
        "5" => pattern_for_five
      })

    {patterns, updated_number_map}
  end
end
