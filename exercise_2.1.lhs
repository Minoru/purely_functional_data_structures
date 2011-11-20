\documentclass{article}
%include lhs2TeX.fmt
\begin{document}

\textbf{Exercise 2.1}
Write the function @suffixes@ of type @[a] -> [[a]]@ that takes a
list @xs@ and returns a list of all the suffixes of @xs@ in
decreasing order of length. For example,

|suffixes [1,2,3,4] = [[1,2,3,4], [2,3,4], [3,4], [4], []]|

\begin{code}
suffixes :: [a] -> [[a]]
suffixes l@(_:xs) = helper [l] xs
  where
    helper acc []       = acc ++ [[]]
    helper acc y@(_:ys) = helper (acc ++ [y]) ys
\end{code}

\end{document}
