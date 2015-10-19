defmodule Control.Monad.WriterTest do
  use ExUnit.Case
  alias Data.Writer
  import Writer
  import Control.Helpers
  import Control.Monad

  test "log" do
    assert value(2) |> log("msg 1")
      == %Writer{value: 2, log: ["msg 1"]}
    assert value(2) |> log("msg 1") |> bind(fn x -> %Writer{} |> return(x) end)
      == value(2) |> log("msg 1")
    assert value(2) |> log("msg 1") |> bind(&(%Writer{} |> log("msg 2") |> return(&1 * 2)))
      == value(4) |> log("msg 1") |> log("msg 2")
  end

  test "bind" do
    assert value(2) |> bind(fn x -> %Writer{} |> return(x) end)
      == value(2)
    assert value(2) |> bind(&(%Writer{} |> return(&1 * 2)))
      == value(4)
  end

  test "~>>" do
    assert value(2) ~>> fn x -> %Writer{} |> return(x) end
      == value(2)
    assert value(2) ~>> fn x -> %Writer{} |> return(x * 2) end
      == value(4)
  end

  test "laws" do
    x = 1
    m = value(2)
    f = fn x -> %Writer{} |> return(x + 2) end
    g = fn x -> %Writer{} |> return(x + 3) end

    assert %Writer{} |> return(x) ~>> f == f.(x)
    assert m |> return == m
    assert (m ~>> f) ~>> g == m ~>> &(f.(&1) ~>> g)
  end
end
