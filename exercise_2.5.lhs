\documentclass{article}
%include lhs2TeX.fmt
\usepackage{enumerate}
\begin{document}
\textbf{Exercise 2.5}
Sharing can also be useful withing a single object, not just between
objects.  For example, if the two subtrees of a given node are identical, than
they can be represented by the same tree.

\begin{enumerate}[(a)]
\item Using this idea, write a function @complete@ of type @a -> Int ->
Tree a@ where @complete x d@ creates a complete binary tree of depth $d$ with
$x$ stored in every node. (Of course, this function makes no sense for the set
abstraction, but it can be useful as an auxiliary function for other
abstractions, such as bags.) This function should run in $O(d)$ time.

\begin{code}
data Tree a  =  Empty
             |  Tree (Tree a) a (Tree a)
  deriving Show

complete :: a -> Int -> Tree a
complete x d = iter d Empty
  where
    iter 0 t = t
    iter i t = iter (i-1) (Tree t x t)
\end{code}

\emph{Time complexity of that algorithm is obviously $O(d)$, because we have
iterative process with $d$ iterations.}

\item Extend this function to create balanced trees of arbitrary size.
Trese trees will not always be complete binary trees, but should be as balanced
as possible: for any given node, the twoo subtrees should differ in size by at
most one. This function should run in $O(\log n)$ time. (Hint: use a helper
function @create2@ that, given a size $m$, creates a pair of trees, one of size
$m$ and other of size $m + 1$.)

\begin{code}
complete2 :: a -> Int -> Tree a
complete2 x n
  | n == 0      = Empty
  | n == 1      = Tree Empty x Empty
  | even (n-1)  = Tree a x a
  | odd  (n-1)  = Tree b x c
  where
    a       = complete2 x n'
    (b, c)  = complete' n'
    n'      = (n-1) `div` 2

    complete' i =  let  j = complete2  x   i
                        k = complete2  x  (i+1)
                   in   (j, k)
\end{code}

\emph{Algorithm have time complexity of $O(\log n)$ because it's recursive and
number of recursive calls equals to depth of the tree, which happens to be in
the range of $((\log n)-1, \log n]$.}

\emph{I'm not pleased with this solution because subtrees of subtrees of node
can't share elements.}

\end{enumerate}
\end{document}
 
