defimpl Control.Functor, for: List do
  defdelegate fmap(list, fun), to: Enum, as: :map
end
