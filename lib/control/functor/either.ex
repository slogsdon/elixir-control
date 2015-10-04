defimpl Control.Functor, for: Data.Either do
  def fmap(%{left: l} = f, _) when l != nil, do: f
  def fmap(%{right: r}, fun) do
    fun
    |> apply([r])
    |> Data.Either.right
  end
end
