defprotocol Control.Applicative do
  @moduledoc """
  Applicatives (or more specifically applicative functors)
  are a special form of `Control.Functor` where the value
  within the functor is a function.
  """

  @doc """
  """
  @spec apply(t, Control.Functor.t) :: t
  def apply(fun, f)
end
