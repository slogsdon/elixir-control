defimpl Control.Monoid, for: List do
  def mempty(_), do: []
  defdelegate mappend(a, b), to: Kernel, as: :++
end
