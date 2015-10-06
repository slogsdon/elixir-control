defmodule Data.Either do
  @moduledoc """
  The `Data.Either` type represents values with
  two possibilities: `left(a)` or `right(b)`.

  The Either type is sometimes used to represent a
  value which is either correct or an error; by
  convention, the `left/1` constructor is used to
  hold an error value and the `right/1` constructor
  is used to hold a correct value (mnemonic:
  "right" also means "correct").
  """

  @type t :: %__MODULE__{
    left: term,
    right: term
  }
  defstruct left: nil,
            right: nil

  @doc """
  The left ("error") constructor.
  """
  @spec left(term) :: t
  def left(v) do
    __MODULE__ |> struct(left: v)
  end

  @doc """
  The right ("correct") constructor.
  """
  @spec right(term) :: t
  def right(v) do
    __MODULE__ |> struct(right: v)
  end
end
