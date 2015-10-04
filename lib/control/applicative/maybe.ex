defimpl Control.Applicative, for: Data.Maybe do
  def apply(%{nothing: true} = f, _), do: f
  def apply(%{just: fun}, f) do
    f |> Control.Functor.fmap(fun)
  end
end
