defmodule Control.Functor.EitherTest do
  use ExUnit.Case
  alias Data.Either
  import Either
  import Control.Helpers
  import Control.Functor

  test "right" do
    assert right(1)
      ==  %Either{right: 1, left: nil}
    assert right(1) |> fmap(&(&1+1))
      == %Either{right: 2, left: nil}
  end

  test "left" do
    assert left("error")
      == %Either{right: nil, left: "error"}
    assert left("error") |> fmap(fn _ -> left("next error") end)
      == %Either{right: nil, left: "error"}
    assert right(1) |> fmap(fn _ -> left("error") end)
      == %Either{right: %Either{right: nil, left: "error"}, left: nil}
  end

  test "laws" do
    f = right(1)
    id = fn x -> x end
    p = fn x -> x + 1 end
    q = fn x -> x + 2 end

    assert f |> fmap(id) == id.(f)
    assert f |> fmap(q <|> p) == f |> fmap(p) |> fmap (q)
  end
end
