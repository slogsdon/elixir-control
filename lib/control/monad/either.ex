defimpl Control.Monad, for: Data.Either do
  def return(m, nil), do: m
  def return(%{right: nil, left: nil}, value) do
    Data.Either.right(value)
  end

  def bind(%{left: l} = m, _) when l != nil, do: m
  def bind(%{right: v}, fun) do
    v |> fun.()
  end
end
