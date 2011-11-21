\documentclass{article}
%include lhs2TeX.fmt
\begin{document}
\textbf{Exercise 2.3}
Inserting an existing element into a binary search tree copies the entire
search path even though the copied nodes are indistinguishable from the
originals. Rewrite @insert@ using exceptions to avoid this copying. Establish
only one handler per insertion rather than one handler per iteration.

%if style == tt
%format <- = "$\gets$"
%else
%format <- = "\gets"
%endif

\begin{code}
{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances #-}

import Data.Maybe (fromMaybe)

class Set s a where
  empty  :: s a
  insert :: a -> s a -> s a
  member :: a -> s a -> Bool

data Tree a = Empty
            | Tree (Tree a) a (Tree a)
  deriving Show

instance Ord a => Set Tree a where
  empty = Empty

  insert x t = fromMaybe t (insert' t)
    where
      insert' Empty           = Just (Tree Empty x Empty)
      insert' s@(Tree a y b)  = do
        a' <- insert' a
        b' <- insert' b
        if x < y
          then return $ Tree a' y b
          else if x > y
            then return $ Tree a y b'
            else return s
  
  member = undefined
\end{code}
\end{document}

