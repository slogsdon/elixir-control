defimpl Control.Monad, for: List do
  def return(m, nil), do: m
  def return([], value) do
    [value]
  end

  def bind(xs, fun) do
    xs
    |> Enum.map(fun)
    |> List.flatten
  end
end
