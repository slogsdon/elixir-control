defmodule Control.Monad.MaybeTest do
  use ExUnit.Case
  alias Data.Maybe
  import Maybe
  import Control.Helpers
  import Control.Monad

  test "bind" do
    assert nothing |> bind(fn _ -> nothing end)
      == nothing
    assert nothing |> bind(&(just(&1 * 2)))
      == nothing

    assert just(2) |> bind(fn _ -> nothing end)
      == nothing
    assert just(2) |> bind(&(just(&1 * 2)))
      == just(4)
  end

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

  test "laws" do
    x = 1
    m = just(1)
    f = fn x -> just(x + 2) end
    g = fn x -> just(x + 3) end

    assert %Maybe{} |> return(x) ~>> f == f.(x)
    assert m |> return == m
    assert (m ~>> f) ~>> g == m ~>> &(f.(&1) ~>> g)
  end
end
