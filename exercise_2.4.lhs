\documentclass{article}
%include lhs2TeX.fmt
\begin{document}
\textbf{Exercise 2.4}
Combine the ideas of the previous two exercises to obtain a version of @insert@
that performs no unnecessary copying and uses no more than $d + 1$ comparisons.

% For some reason, <- is being typesetted as \in (∈). Use left arrow instead:
%if style == tt
%format <- = "$\gets$"
%else
%format <- = "\gets"
%endif

\begin{code}
import Data.Maybe (fromMaybe)

data Tree a  =  Empty
             |  Tree (Tree a) a (Tree a)
  deriving Show

insert :: (Ord a) => a -> Tree a -> Tree a
insert x Empty           = Tree Empty x Empty
insert x t@(Tree a y b)  = fromMaybe t (insert' Empty t)
  where
    insert' Empty           Empty  = Just (Tree Empty x Empty)
    insert' l@(Tree a z b)  Empty  = 
      if x /= z
        then Just (Tree Empty x Empty)
        else Just Empty
    insert' l s@(Tree a y b) = do
      a' <- insert' l a
      b' <- insert' s b
      if x < y
        then  return $ Tree a' y b
        else  return $ Tree a y b'
\end{code}
\end{document}

