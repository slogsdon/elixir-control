defmodule Control.Helpers do
  @moduledoc """
  A set of helper functions to ease the process of
  working with the `Control.*` protocols.
  """

  alias Control.Monad

  @compile {:inline, ~>>: 2, <|>: 2}

  @doc """
  Bind operator.

  The bind operator (`>>=` in Haskell) removes the need
  for piping to a call to `Control.Monad.bind/2`, so

      functor |> Control.Monad.bind(fun)

  becomes

      functor ~>> fun
  """
  @spec (Monad.t ~>> (term -> Monad.t)) :: Monad.t
  def left ~>> right do
    Monad.bind(left, right)
  end

  @doc """
  Compose operator.

  The compose operator (`.` in Haskell) removes the need
  for using `apply/2` or `.()` to call an anonymous
  function, so

      f.(g.(x)) or f |> apply([g |> apply([x])])

  becomes

      (
  """
  @spec (Function.t <|> Function.t) :: Function.t
  def left <|> right do
    fn x -> left.(right.(x)) end
  end
end
