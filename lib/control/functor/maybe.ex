defimpl Control.Functor, for: Data.Maybe do
  def fmap(%{nothing: true} = f, _), do: f
  def fmap(%{just: v}, fun) do
    v
    |> fun.()
    |> Data.Maybe.just
  end
end
