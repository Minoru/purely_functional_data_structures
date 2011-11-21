\documentclass{article}
%include lhs2TeX.fmt
\begin{document}
\textbf{Exercise 2.6}
Adapt the @UnbalancedSet@ functor to support finite maps rather than sets.

\begin{code}
{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances #-}
import Data.Maybe (fromMaybe)

class FiniteMap m k where
  empty  :: m k a
  bind   :: k -> a -> m k a -> m k a
  lookup :: k -> m k a -> Maybe a

data Map k a  =  Empty
              |  Map (Map k a) k a (Map k a)
  deriving Show

instance Ord k => FiniteMap Map k where
  empty = Empty

  bind k x m = fromMaybe m (bind' empty m)
    where
      bind' Empty Empty = Just (Map Empty k x Empty)
      -- fallback
      bind' z@(Map l a b r) Empty = 
        if k /= a
          then Just (Map Empty k x Empty)
          else Nothing
      -- usual case
      bind' p z@(Map l a b r) = do
        l' <- bind' p l
        r' <- bind' z r
        if k < a
          then  return $ Map l' a b r
          else  return $ Map l  a b r'

  lookup x m = lookup' Empty m
    where
      lookup' Empty Empty = Nothing
      -- fallback
      lookup' (Map _ k y _) Empty =
        if x /= k
          then Nothing
          else Just y
      -- usual case
      lookup' p m@(Map l k y r) =
        if x < k
          then lookup' p l
          else lookup' m r
\end{code}
\end{document}

