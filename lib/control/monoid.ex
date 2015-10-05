defprotocol Control.Monoid do
  @moduledoc """
  A monoid is a function and an identity for a given type.

  In more detail, a monoid is when you have an associative
  binary function and a value which acts as an identity
  with respect to that function. When something acts as an
  identity with respect to a function, it means that when
  called with that function and some other value, the
  result is always equal to that other value. `1` is the
  identity with respect to `*` and `[]` is the identity
  with respect to `++`. There are a lot of other monoids
  to be found in the world of Elixir, which is why the
  `Control.Monoid` protocol exists. It's for types which
  can act like monoids.

  ## Laws

  All implementations of `Control.Monoid` should obey the
  following implicit laws:

      mempty(type) |> mappend(x)  = x
      x |> mappend(mempty(type))  = x
      mappend(x, y) |> mappend(z) = x |> mappend(y |> mappend(z))

  where `type` is a type and `x`, `y`, and `z` are all values
  of that type.
  """

  @doc """
  The identity value.

  It should act as a polymorphic constant, but due to
  protocols needing a type for dispatching to the correct
  implementation, it requires a type to be passed as an
  argument.
  """
  @spec mempty(t) :: t
  def mempty(a)

  @doc """
  The binary function.

  It takes two values of the same type and returns a
  value of that type as well.
  """
  @spec mappend(t, t) :: t
  def mappend(a, b)
end
