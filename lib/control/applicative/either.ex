defimpl Control.Applicative, for: Data.Either do
  def apply(%{left: l} = f, _) when l != nil, do: f
  def apply(%{right: fun}, f) do
    f |> Control.Functor.fmap(fun)
  end
end
