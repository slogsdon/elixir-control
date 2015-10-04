defprotocol Control.Applicative do
  @moduledoc """
  """

  @doc """
  """
  @spec apply(t, Control.Functor.t) :: t
  def apply(fun, f)
end
