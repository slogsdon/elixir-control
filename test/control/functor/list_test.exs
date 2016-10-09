defmodule Control.Functor.ListTest do
  use ExUnit.Case
  import Control.Helpers
  import Control.Functor

  test "fmap" do
    assert [] |> fmap(&(&1 + 1))
      == []
    assert [1,2,3] |> fmap(&(&1 * 2))
      == [2,4,6]
  end

  test "laws" do
    f = [1]
    id = fn x -> x end
    p = fn x -> x + 1 end
    q = fn x -> x + 2 end

    assert f |> fmap(id) == id.(f)
    assert f |> fmap(q <|> p) == f |> fmap(p) |> fmap(q)
  end
end
