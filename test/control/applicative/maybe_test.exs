defmodule Control.Applicative.MaybeTest do
  use ExUnit.Case
  alias Data.Maybe
  import Maybe
  alias Control.Applicative, as: A

  test "apply" do
    f = &(&1 + 1)
    assert just(f)
      == %Maybe{just: f, nothing: false}
    assert just(f) |> A.apply(just(2))
      == just(3)
    assert nothing() |> A.apply(just(2))
      == nothing()
    assert nothing() |> A.apply(nothing())
      == nothing()
  end
end
