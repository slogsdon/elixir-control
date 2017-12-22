defmodule Control.Functor.MaybeTest do
  use ExUnit.Case
  alias Data.Maybe
  import Maybe
  import Control.Helpers
  import Control.Functor

  test "just" do
    assert just(1)
      ==  %Maybe{just: 1, nothing: false}
    assert just(1) |> fmap(&(&1+1))
      == %Maybe{just: 2, nothing: false}
  end

  test "left" do
    assert nothing()
      == %Maybe{just: nil, nothing: true}
    assert nothing() |> fmap(fn _ -> nothing() end)
      == %Maybe{just: nil, nothing: true}
    assert just(1) |> fmap(fn _ -> nothing() end)
      == %Maybe{just: %Maybe{just: nil, nothing: true}, nothing: false}
  end

  test "laws" do
    f = just(1)
    id = fn x -> x end
    p = fn x -> x + 1 end
    q = fn x -> x + 2 end

    assert f |> fmap(id) == id.(f)
    assert f |> fmap(q <|> p) == f |> fmap(p) |> fmap(q)
  end
end
