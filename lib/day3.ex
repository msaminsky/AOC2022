defmodule Day03 do
  @moduledoc """
  Documentation for `Day03`.
  """

  @input_url "https://adventofcode.com/2022/day/3/input"

  def puzzle_solver(input_url \\ @input_url, puzzle)

  def puzzle_solver(input_url, :puzzle1) do
    Utils.get_input(input_url)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn rucksack ->
      rucksack_list = rucksack |> to_charlist()
      compartment_length = (length(rucksack_list) / 2) |> floor()

      get_intersection(Enum.chunk_every(rucksack_list, compartment_length))
      |> MapSet.to_list()
      |> Enum.map(&letter_to_priority(&1))
      |> Enum.sum()
    end)
    |> Enum.sum()
  end

  def puzzle_solver(input_url, :puzzle2) do
    Utils.get_input(input_url)
    |> String.trim()
    |> String.split("\n")
    |> Enum.chunk_every(3)
    |> Enum.map(fn rucksack ->
      rucksack
      |> Enum.map(&to_charlist(&1))
      |> get_intersection()
      |> MapSet.to_list()
      |> Enum.map(&letter_to_priority(&1))
      |> Enum.sum()
    end)
    |> Enum.sum()
  end

  def get_intersection(compartments) do
    Enum.map(compartments, &MapSet.new(&1))
    |> Enum.reduce(
      MapSet.new(),
      fn curr_val, acc ->
        if length(MapSet.to_list(acc)) > 0 do
          MapSet.intersection(acc, curr_val)
        else
          curr_val
        end
      end
    )
  end

  def letter_to_priority(char) do
    # A-Z are represented by ints 65-90
    # a-z are represented by ints 97-122
    case char < 91 do
      true -> char - 38
      _ -> char - 96
    end
  end
end
