defmodule Control.HelpersTest do
  use ExUnit.Case
  alias Data.Maybe
  import Maybe
  import Control.Helpers

  test "~>>" do
    assert nothing ~>> fn _ -> nothing end
      == nothing
    assert nothing ~>> &(just(&1 * 2))
      == nothing

    assert just(2) ~>> fn _ -> nothing end
      == nothing
    assert just(2) ~>> &(just(&1 * 2))
      == just(4)
  end

  test "<|>" do
    f = fn x -> x + 2 end
    g = fn x -> x / 2 end

    assert (f <|> g).(2) == f.(g.(2))
    assert (f <|> g <|> &h/1).(2) == f.(g.(h(2)))
  end
  defp h(x), do: x - 2
end
