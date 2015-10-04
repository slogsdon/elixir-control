defmodule Data.Either do
  @type t :: %__MODULE__{
    left: term,
    right: term
  }
  defstruct left: nil,
            right: nil

  def left(v), do: __MODULE__ |> struct(left: v)
  def right(v), do: __MODULE__ |> struct(right: v)
end
