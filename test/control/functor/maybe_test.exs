defmodule Control.Functor.MaybeTest do
  use ExUnit.Case
  alias Data.Maybe
  import Maybe
  import Control.Functor

  test "just" do
    assert just(1)
      ==  %Maybe{just: 1, nothing: false}
    assert just(1) |> fmap(&(&1+1))
      == %Maybe{just: 2, nothing: false}
  end

  test "left" do
    assert nothing
      == %Maybe{just: nil, nothing: true}
    assert just(1) |> fmap(fn _ -> nothing end)
      == %Maybe{just: %Maybe{just: nil, nothing: true}, nothing: false}
  end
end
