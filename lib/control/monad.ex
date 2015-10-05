defprotocol Control.Monad do
  @moduledoc """
  A monad is essentially a value with a context.

  Just as applicative functors are special versions of
  functors, monads are special versions of applicative
  functors.

  ## Laws

  All implementations of `Control.Monad` should obey the
  following implicit laws:

      type |> return(x) ~>> f = f(x)
      m ~>> return            = m
      (m ~>> f) ~>> g         = m ~>> &(f(&1) ~>> g)

  where `m` is a monad, `x` is a value, and `f` and `g` are
  both functions that return monadic values.
  """

  @doc """
  `return` takes a value and puts it in a minimal default
  context that still holds that value. In other words, it
  takes something and wraps it in a monad.
  """
  @spec return(t) :: t
  @spec return(t, term) :: t
  def return(m, value \\ nil)

  @doc """
  `bind` is similar to function application, only instead of
  taking a normal value and feeding it to a normal function,
  it takes a monadic value (that is, a value with a context)
  and feeds it to a function that takes a normal value but
  returns a monadic value.
  """
  @spec bind(t, (term -> t)) :: t
  def bind(m, fun)
end
