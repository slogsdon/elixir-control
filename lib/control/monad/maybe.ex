defimpl Control.Monad, for: Data.Maybe do
  def bind(%{nothing: true} = f, _), do: f
  def bind(%{just: v}, fun) do
    fun |> apply([v])
  end
end
