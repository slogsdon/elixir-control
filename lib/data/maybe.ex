defmodule Data.Maybe do
  @moduledoc """
  The `Data.Maybe  type encapsulates an optional value.

  A value of type `Data.Maybe<a>` either contains a
  value of type `a` (represented as `just(a)`), or it
  is empty (represented as `nothing`). Using
  `Data.Maybe` is a good way to deal with errors or
  exceptional cases without resorting to drastic
  measures such as error.

  The `Data.Maybe` type is also a monad. It is a
  simple kind of error monad, where all errors are
  represented by `nothing`. A richer error monad can be
  built using the `Data.Either` type.
  """

  @type t :: %__MODULE__{
    just: term,
    nothing: boolean
  }
  defstruct just: nil,
            nothing: false

  @doc """
  Instantiates `Data.Maybe` value containing `v` of
  type `term`.
  """
  @spec just(term) :: t
  def just(v) do
    __MODULE__ |> struct(just: v)
  end

  @doc """
  Instantiates an "empty" `Data.Maybe` value.
  """
  @spec nothing :: t
  def nothing do
    __MODULE__ |> struct(nothing: true)
  end
end
