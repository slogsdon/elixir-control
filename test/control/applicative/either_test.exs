defmodule Control.Applicative.EitherTest do
  use ExUnit.Case
  alias Data.Either
  import Either
  alias Control.Applicative, as: A

  test "apply" do
    f = &(&1 + 1)
    assert right(f)
      == %Either{right: f, left: nil}
    assert right(f) |> A.apply(right(2))
      == right(3)
    assert left("error") |> A.apply(right(2))
      == left("error")
    assert left("error 1") |> A.apply(left("error 2"))
      == left("error 1")
  end
end
