defmodule Control.Helpers do
  @moduledoc """
  A set of helper functions to ease the process of
  working with the `Control.*` protocols.
  """

  alias Control.Monad

  @compile {:inline, ~>>: 2}

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
end
