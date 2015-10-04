defmodule Data.Maybe do
  @type t :: %__MODULE__{
    just: term,
    nothing: boolean
  }
  defstruct just: nil,
            nothing: false

  def just(v), do: __MODULE__ |> struct(just: v)
  def nothing, do: __MODULE__ |> struct(nothing: true)
end
