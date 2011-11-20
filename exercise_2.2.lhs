\documentclass{article}
%include lhs2TeX.fmt
\begin{document}
\textbf{Exercise 2.2 (Anderson [And91])}
In the worst case, @member@ performs approximately $2d$ comparisons, where $d$
is the depth of the tree. Rewrite @member@ to take no more than $d + 1$
comparisons by keeping track of a candidate element that \emph{might} be equal
to the query element (say, the last element for which $<$ returned false or
$\leq$ returned true) and checking for equality only when you hit the bottom of
the tree.

\begin{code}
data Tree a = Empty
            | Tree (Tree a) a (Tree a)
  deriving Show

member :: (Ord a, Show a) => a -> Tree a -> Bool
member = member' Empty
  where
    member' l@(Tree a y b) x t@(Tree Empty z Empty) =
      if x /= z
        then if x /= y
          then False
          else True
        else True
    member' l x t@(Tree a y b) =
      if x < y
        then member' l x a
        else member' t x b
    member' l x Empty = member' l x l
\end{code}
\end{document}

