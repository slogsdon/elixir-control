defmodule Control.Monoid.ListTest do
  use ExUnit.Case
  import Control.Monoid

  test "mempty" do
    assert mempty([]) == []
  end

  test "mappend" do
    assert [] |> mappend([]) == []
    assert [1,2,3] |> mappend([]) == [1,2,3]
    assert [1,2,3] |> mappend([4,5,6]) == [1,2,3,4,5,6]
  end
end
