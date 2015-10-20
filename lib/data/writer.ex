defmodule Data.Writer do
  @moduledoc """
  The `Data.Writer` type encapsulates a values with an
  attached, secondary value that acts like a log.

  `Data.Writer` allows for computations while making
  sure that all the log values are combined into one
  log value that then gets attached to the result.
  """

  import Control.Monoid

  @type t :: %__MODULE__{
    value: nil,
    log: []
  }

  defstruct value: nil,
            log: []

  @doc """
  The log ("tell") helper.
  """
  def log(%__MODULE__{} = writer, log) do
    writer
    |> Map.update!(:log, &(&1 |> mappend([log])))
  end

  @doc """
  The value constructor.
  """
  def value(value) do
    __MODULE__
    |> struct(value: value)
  end
end
