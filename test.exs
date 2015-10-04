import Data.Maybe
alias Control.Applicative, as: A
import Control.Monad

(&(&1 + 2))
|> just
|> A.apply(just(5))
|> bind(&(&1 * 2 |> just))
|> IO.inspect
