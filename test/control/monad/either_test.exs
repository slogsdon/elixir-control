defmodule Control.Monad.EitherTest do
  use ExUnit.Case
  alias Data.Either
  import Either
  import Control.Helpers
  import Control.Monad

  test "bind" do
    assert left("error 1") |> bind(fn _ -> left("error 2") end)
      == left("error 1")
    assert left("error 1") |> bind(&(right(&1 * 2)))
      == left("error 1")

    assert right(2) |> bind(fn _ -> left("error") end)
      == left("error")
    assert right(2) |> bind(&(right(&1 * 2)))
      == right(4)
  end

  test "~>>" do
    assert left("error 1") ~>> fn _ -> left("error 2") end
      == left("error 1")
    assert left("error 1") ~>> &(right(&1 * 2))
      == left("error 1")

    assert right(2) ~>> fn _ -> left("error") end
      == left("error")
    assert right(2) ~>> &(right(&1 * 2))
      == right(4)
  end

  test "laws" do
    x = 1
    m = right(1)
    f = fn x -> right(x + 2) end
    g = fn x -> right(x + 3) end

    assert %Either{} |> return(x) ~>> f == f.(x)
    assert m |> return == m
    assert (m ~>> f) ~>> g == m ~>> &(f.(&1) ~>> g)
  end
end
