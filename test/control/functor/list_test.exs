defmodule Control.Functor.ListTest do
  use ExUnit.Case
  import Control.Functor

  test "fmap" do
    assert [] |> fmap(&(&1 + 1))
      == []
    assert [1,2,3] |> fmap(&(&1 * 2))
      == [2,4,6]
  end
end
