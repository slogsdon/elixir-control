defmodule Control.Helpers do
  @compile {:inline, ~>>: 2}
  def left ~>> right do
    Control.Monad.bind(left, right)
  end
end
