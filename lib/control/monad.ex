defprotocol Control.Monad do
  @moduledoc """
  """

  @doc """
  """
  @spec bind(t, (term -> t)) :: t
  def bind(m, fun)

  def left ~>> right
end
