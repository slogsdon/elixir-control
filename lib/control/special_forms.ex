defmodule Control.SpecialForms do
  @doc """
  defmodule Test do
    require Control.SpecialForms, as: M

    def test do
      Data.Maybe.just(5)
      |> M.'>>='(fn x -> Data.Maybe.just(x + 5) end)
    end
  end

  Test.test
  # %Data.Maybe{just: 10, nothing: false}
  """
  defmacro unquote(:'>>=')(left, right) do
    quote do
      unquote(left)
      |> Control.Monad.bind(unquote(right))
    end
  end
end
