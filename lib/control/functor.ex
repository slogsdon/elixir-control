defprotocol Control.Functor do
  @moduledoc """
  Functors are things that can be mapped over, like lists,
  `Maybe`s, trees, and such.

  Using functors, we can generalize how `Enum.map` works for
  `Enumerable`s on any data type, including `Maybe`. We can
  accomplish this by generalizing the action and implementing
  that action for the desired data types. This generalized
  action for functors is known as `fmap`.

  ## Laws

  All implementations of `Control.Functor` should obey the
  following implicit laws:

      fmap(f, id)       = f |> id
      fmap(f, (p |> q)) = f |> fmap(p) |> fmap (q)

  where `f` is a functor, `id` is a function that returns
  its input, and `p` & `q` are functions.
  """

  @doc """
  """
  @spec fmap(t, (term -> term)) :: t
  def fmap(functor, fun)
end
