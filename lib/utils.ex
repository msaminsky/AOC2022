defmodule Utils do
  @moduledoc """
  Documentation for `utils`.
  """
  import HTTPoison

  @url "https://adventofcode.com/2022/day/1/input"

  def get_input(url \\ @url) do
    %{body: body} =
      HTTPoison.get!(url, %{},
        hackney: [
          cookie: [
            "_ga=GA1.2.183736398.1668526625; _gid=GA1.2.1176731471.1670331742; session=53616c7465645f5f4df72b90fa3a57798d0c8e64387e275c7d8ac26b89fc81d1029cb5f0b547f79a901af4fc3eb1f409c3cc179fb8bd789a5f5212ea02182012"
          ]
        ]
      )

    body
  end
end
