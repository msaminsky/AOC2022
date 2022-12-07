defmodule Day01 do
  @moduledoc """
  Documentation for `Aoc2022`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Aoc2022.hello()
      :world

  """

  def puzzle1(input_url) do
    Utils.get_input(input_url)
    |> String.trim()
    |> String.split("\n\n")
    |> Enum.map(fn x ->
      String.split(x, "\n")
      |> Enum.map(&String.to_integer(&1))
      |> Enum.sum()
    end)
    |> Enum.max()
  end

  def puzzle2(input_url) do
    [top_3 | _tail] =
      Utils.get_input(input_url)
      |> String.trim()
      |> String.split("\n\n")
      |> Enum.map(fn x ->
        String.split(x, "\n")
        |> Enum.map(&String.to_integer(&1))
        |> Enum.sum()
      end)
      |> Enum.sort()
      |> Enum.reverse()
      |> Enum.chunk_every(3)

    Enum.sum(top_3)
  end
end
