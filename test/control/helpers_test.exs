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
end
