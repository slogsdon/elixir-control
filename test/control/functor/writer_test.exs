defmodule Control.Functor.WriterTest do
  use ExUnit.Case
  alias Data.Writer
  import Writer
  import Control.Helpers
  import Control.Functor

  test "value" do
    assert value(1)
      ==  %Writer{value: 1, log: []}
    assert value(1) |> fmap(&(&1+1))
      == %Writer{value: 2, log: []}
  end

  test "log" do
    assert value(1) |> log("msg 1")
      == %Writer{value: 1, log: ["msg 1"]}
    assert value(1) |> log("msg 1") |> fmap(fn _ -> struct(Writer) |> log("msg 2") end)
      == %Writer{value: %Writer{value: nil, log: ["msg 2"]}, log: ["msg 1"]}
    assert value(1) |> fmap(fn _ -> struct(Writer) |> log("msg 2") end)
      == %Writer{value: %Writer{value: nil, log: ["msg 2"]}, log: []}
  end

  test "laws" do
    f = value(1)
    id = fn x -> x end
    p = fn x -> x + 1 end
    q = fn x -> x + 2 end

    assert f |> fmap(id) == id.(f)
    assert f |> fmap(q <|> p) == f |> fmap(p) |>fmap(q)
  end
end
