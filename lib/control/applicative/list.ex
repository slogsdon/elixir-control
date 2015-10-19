defimpl Control.Applicative, for: List do
  def apply([] = f, _), do: f
  def apply(funs, f) do
    funs
    |> Enum.map(&(Control.Functor.fmap(f, &1)))
    |> List.flatten
  end
end
