\documentclass{article}
%include lhs2TeX.fmt
\begin{document}
\textbf{Exercise 3.1}
Prove that the right spine of a leftist heap of size $n$ contains at most
$\lfloor\log (n+1)\rfloor$ elements.

Let $n$ be some power of 2 minus one: $n= 2^m - 1$.
The tree is full, then, and its height is $m$.
Thus the right spine would have length of $m$, too, or the other way round,
$\log (n + 1)$.
We also need to round result down to some integer value as length of right
spine obviously can't be non-integer.
That way, we've got $\lfloor \log (n+1) \rfloor$.

If $n$ is not a power of two, then the length of right spine would be less than
we calculated.
\end{document}
