\documentclass{article}
%include lhs2TeX.fmt
\begin{document}
\textbf{Exercise 2.3}
Inserting an existing element into a binary search tree copies the entire
search path even though the copied nodes are indistinguishable from the
originals. Rewrite @insert@ using exceptions to avoid this copying. Establish
only one handler per insertion rather than one handler per iteration.

% For some reason, <- is being typesetted as \in (∈). Use left arrow instead:
%format <- = "$\gets$"

\begin{code}
import Data.Maybe (fromMaybe)

data Tree a = Empty
            | Tree (Tree a) a (Tree a)
  deriving Show

insert :: (Ord a) => a -> Tree a -> Tree a
insert x t = fromMaybe t (insert' t)
  where
    insert' Empty = Just (Tree Empty x Empty)
    insert' s@(Tree a y b) = do
      a' <- insert' a
      b' <- insert' b
      if x < y
        then return (Tree a' y b)
        else if x > y
          then return (Tree a y b')
          else return s
\end{code}
\end{document}

