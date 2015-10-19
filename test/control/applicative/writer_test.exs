defmodule Control.Applicative.WriterTest do
  use ExUnit.Case
  alias Data.Writer
  import Writer
  alias Control.Applicative, as: A

  test "apply" do
    f = &(&1 + 1)
    assert value(f)
      == %Writer{value: f, log: []}
    assert value(f) |> A.apply(value(2))
      == value(3)
    assert value(f) |> log("msg 1") |> A.apply(value(2))
      == value(3)
    assert value(f) |> A.apply(value(2) |> log("msg 1"))
      == value(3) |> log("msg 1")
  end
end
