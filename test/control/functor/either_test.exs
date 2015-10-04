defmodule Control.Functor.EitherTest do
  use ExUnit.Case
  alias Data.Either
  import Either
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
    assert right(1) |> fmap(fn _ -> left("error") end)
      == %Either{right: %Either{right: nil, left: "error"}, left: nil}
  end
end
