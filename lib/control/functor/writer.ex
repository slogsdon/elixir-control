defimpl Control.Functor, for: Data.Writer do
  def fmap(w, fun) do
    w.value
    |> fun.()
    |> Data.Writer.value
    |> Map.put(:log, w.log)
  end
end
