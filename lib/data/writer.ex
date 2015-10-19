defmodule Data.Writer do
  import Control.Monoid

  @type t :: %__MODULE__{
    value: nil,
    log: []
  }

  defstruct value: nil,
            log: []

  def log(%__MODULE__{} = writer, log) do
    writer
    |> Map.update!(:log, &(&1 |> mappend([log])))
  end

  def value(value) do
    __MODULE__
    |> struct(value: value)
  end
end
