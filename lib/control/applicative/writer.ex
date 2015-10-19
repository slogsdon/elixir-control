defimpl Control.Applicative, for: Data.Writer do
  def apply(w, f) do
    f |> Control.Functor.fmap(w.value)
  end
end
