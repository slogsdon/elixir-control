defprotocol Control.Monoid do
  @moduledoc """
  """

  @doc """
  """
  @spec mempty(t) :: t
  def mempty(a)

  @doc """
  """
  @spec mappend(t, t) :: t
  def mappend(a, b)
end
