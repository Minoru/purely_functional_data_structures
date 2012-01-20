\documentclass{article}
%include lhs2TeX.fmt
\begin{document}
\textbf{Exercise 3.1}
Prove that the right spine of a leftist heap of size $n$ contains at most
$\lfloor\log (n+1)\rfloor$ elements.

Let $n$ be some power of 2: $n = 2^m$.
The tree is full, then, and its height is $m$.
Thus the right spine would have length of $m$, too, or the other way round,
$\log n$.
But for tree of size 0 that formula would give us $-\inf$, which is incorrect.
To fix that let's add 1 to the argument of $\log$ and use floor rounding to
remove its impact on other results.
That way, we've got $\lfloor \log (n+1) \rfloor$.

If $n$ is not a power of two, then the length of right spine would be less than
we calculated.
Note that in that case 1 we added to $n$ would also play its role as formula
would return the length of right spine for bigger tree.

\emph{I think it's not the best proof ever, and I would welcome any help in
making it more precise and strict.}
\end{document}
