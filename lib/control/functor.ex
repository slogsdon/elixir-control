defprotocol Control.Functor do
  @moduledoc """
  Functors are things that can be mapped over, like lists,
  `Maybe`s, trees, and such.
  """

  @doc """
  """
  @spec fmap(t, (term -> term)) :: t
  def fmap(functor, fun)
end
