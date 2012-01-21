\documentclass{article}
%include lhs2TeX.fmt
\begin{document}
\textbf{Exercise 3.3}
Implement a function @fromList@ of type @a -> Heap@ that produces a leftist heap from an unordered list of elements by first converting each element into singleton heap and then merging the heaps until only one heap remains.
Instead of merging the heaps in one right-to-left or left-to-right pass using @foldr@ or @foldl@, merge the heaps in $\lceil \log n \rceil$ passes, where each pass marges adjacent pairs of heaps.
Show that @fromList@ takes only $O(n)$ time.

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

fromList :: Ord a => [a] -> LeftistHeap a
fromList [] = E
fromList a = mergePairs $ map singleton a
  where
    singleton x = T 1 x E E
    
    mergePairs (x:[]) = x
    mergePairs (x:y:[]) = merge x y
    mergePairs x = merge (mergePairs l) (mergePairs r)
      where
        l = take half x
        r = take other_half x
        half = len `div` 2
        other_half = len `div` 2  +  len `mod` 2
        len = length x

instance Heap LeftistHeap where
  merge h E = h
  merge E h = h
  merge h1@(T _ x a1 b1) h2@(T _ y a2 b2) =
    if x <= y
      then makeT x a1 (merge b1 h2)
      else makeT y a2 (merge h1 b2)

  empty = undefined
  isEmpty _ = undefined
  insert _ _ = undefined
  findMin _ = undefined
  deleteMin _ = undefined
\end{code}

Merging singeton heap with empty heap have constant time complexity, $O(1)$.
To merge each pair of singletons, we need to do $\frac{n}{2}$ merges.
After that, we need to perform pair merges on $\frac{n}{4}$, $\frac{n}{8}$,
etc. elements to finally get resulting heap.
Summing all that and dropping constant factors, we'll get $O(n)$ time
complexity.
\end{document}
