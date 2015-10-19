defmodule Control.Monad.ListTest do
  use ExUnit.Case
  import Control.Helpers
  import Control.Monad

  test "bind" do
    assert [] |> bind(fn _ -> [] end)
      == []
    assert [] |> bind(&([&1 * 2]))
      == []

    assert [2] |> bind(fn _ -> [] end)
      == []
    assert [2] |> bind(&([&1 * 2]))
      == [4]
  end

  test "~>>" do
    assert [] ~>> fn _ -> [] end
      == []
    assert [] ~>> &([&1 * 2])
      == []

    assert [2] ~>> fn _ -> [] end
      == []
    assert [2] ~>> &([&1 * 2])
      == [4]
  end

  test "laws" do
    x = 1
    m = [1]
    f = fn x -> [x + 2] end
    g = fn x -> [x + 3] end

    assert [] |> return(x) ~>> f == f.(x)
    assert m |> return == m
    assert (m ~>> f) ~>> g == m ~>> &(f.(&1) ~>> g)
  end
end
