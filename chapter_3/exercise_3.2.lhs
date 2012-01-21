\documentclass{article}
%include lhs2TeX.fmt
\begin{document}
\textbf{Exercise 3.2}
Define @insert@ directly rather than via a call to @merge@.

\begin{code}
import Heap

data LeftistHeap a  =  E
                    |  T Int a (LeftistHeap a) (LeftistHeap a)
  deriving (Show, Eq)

rank E = 0
rank (T r _ _ _) = r

makeT x a b = if rank a >= rank b
  then T (rank b + 1) x a b
  else T (rank a + 1) x b a

instance Heap LeftistHeap where
  insert x h@(T _ y l r) = if x <= y
    then makeT x h E
    else makeT y l (insert x r)
  insert x E = T 1 x E E

  merge h E = h
  merge E h = h
  merge h1@(T _ x a1 b1) h2@(T _ y a2 b2) =
    if x <= y
      then makeT x a1 (merge b1 h2)
      else makeT y a2 (merge h1 b2)
  
  empty = undefined
  isEmpty _ = undefined
  findMin _ = undefined
  deleteMin _ = undefined
\end{code}
\end{document}

