defimpl Control.Monad, for: Data.Maybe do
  def return(m), do: m
  def return(%{just: nil, nothing: false}, value) do
    Data.Maybe.just(value)
  end

  def bind(%{nothing: true} = m, _), do: m
  def bind(%{just: v}, fun) do
    fun |> apply([v])
  end
end
