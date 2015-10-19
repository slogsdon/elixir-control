defimpl Control.Monad, for: Data.Writer do
  import Control.Monoid

  def return(w, nil), do: w
  def return(w, value) do
    w |> Map.put(:value, value)
  end

  def bind(%{value: v, log: t}, fun) do
    v
    |> fun.()
    |> Map.update!(:log, &(t |> mappend(&1)))
  end
end
