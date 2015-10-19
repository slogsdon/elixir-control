defmodule Control.Applicative.ListTest do
  use ExUnit.Case
  alias Control.Applicative, as: A

  test "apply" do
    f = &(&1 + 1)
    assert [f] |> A.apply([2])
      == [3]
    assert [] |> A.apply([2])
      == []
    assert [] |> A.apply([])
      == []
  end
end
