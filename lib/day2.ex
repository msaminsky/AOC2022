defmodule Day02 do
  @moduledoc """
  Documentation for `Day02`.
  """

  @input_url "https://adventofcode.com/2022/day/2/input"

  def puzzle_solver(input_url \\ @input_url, puzzle) do
    Utils.get_input(input_url)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn x ->
      String.split(x, " ") |> outcome_calculator(puzzle: puzzle)
    end)
    |> Enum.sum()
  end

  def outcome_calculator([opponent, me], puzzle: :puzzle1) do
    case {opponent, me} do
      {"A", "X"} -> 1 + 3
      {"A", "Y"} -> 2 + 6
      {"A", "Z"} -> 3 + 0
      {"B", "X"} -> 1 + 0
      {"B", "Y"} -> 2 + 3
      {"B", "Z"} -> 3 + 6
      {"C", "X"} -> 1 + 6
      {"C", "Y"} -> 2 + 0
      {"C", "Z"} -> 3 + 3
    end
  end

  def outcome_calculator([opponent, me], puzzle: :puzzle2) do
    case {opponent, me} do
      {"A", "X"} -> 3 + 0
      {"A", "Y"} -> 1 + 3
      {"A", "Z"} -> 2 + 6
      {"B", "X"} -> 1 + 0
      {"B", "Y"} -> 2 + 3
      {"B", "Z"} -> 3 + 6
      {"C", "X"} -> 2 + 0
      {"C", "Y"} -> 3 + 3
      {"C", "Z"} -> 1 + 6
    end
  end
end
