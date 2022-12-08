defmodule Day04 do
  @moduledoc """
  Documentation for `Day04`.
  """

  @input_url "https://adventofcode.com/2022/day/4/input"

  def puzzle_solver(input_url \\ @input_url, puzzle)

  def puzzle_solver(input_url, :puzzle1) do
    Utils.get_input(input_url)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&process_line(&1))
    |> Enum.map(&list_fully_contained?(&1))
    |> Enum.filter(fn x -> x == true end)
    |> length()
  end

  def puzzle_solver(input_url, :puzzle2) do
    Utils.get_input(input_url)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&process_line(&1))
    |> Enum.map(&list_overlaps?(&1))
    |> Enum.filter(fn x -> x == true end)
    |> length()
  end

  def process_line(line) do
    # "24-66,23-25"
    # should output to [24,66],[23,25]
    line |> String.split(",") |> Enum.map(&String.split(&1, "-"))
  end

  def list_fully_contained?([[x1, y1], [x2, y2]]) do
    # ex. [[1,10], [4,9]]
    set1 = MapSet.new(String.to_integer(x1)..String.to_integer(y1))
    set2 = MapSet.new(String.to_integer(x2)..String.to_integer(y2))

    MapSet.subset?(set1, set2) || MapSet.subset?(set2, set1)
  end

  def list_overlaps?([[x1, y1], [x2, y2]]) do
    # ex. [[1,10], [4,9]]
    set1 = MapSet.new(String.to_integer(x1)..String.to_integer(y1))
    set2 = MapSet.new(String.to_integer(x2)..String.to_integer(y2))

    MapSet.intersection(set1, set2) |> MapSet.to_list() |> length() >= 1
  end
end
