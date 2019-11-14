> module Ch1 ( uncurry'
>            , curry'
>            )
> where

1.2-i. Determine the cardinality of Either Bool (Bool, Maybe Bool) -> Bool.

|Bool| = 2
|Either a b| = |a|+|b|
|(a,b)| = |a|x|b|
|a -> b| = |b|^|a|
|Maybe a| = 1 + |a|

|Maybe Bool| = 1 + 2 = 3
|(Bool, Maybe Bool)| = 2 * 3 = 6
|Either Bool (Bool, Maybe Bool)| = 2 + 6 = 8
|Either Bool (Bool, Maybe Bool) -> Bool| = 2 ^ 8 = 256


1.4-i. Use Curry–Howard to prove that (a^b)^c = a^(b×c). That is, provide a function of type (b -> c -> a) -> (b, c) -> a, and one of ((b,c)->a)->b->c->a. Make sure they satisfy the equalities to . from = id and from . to = id. Do these functions remind you of anything from Prelude?

> uncurry' :: (b -> c -> a) -> (b, c) -> a
> uncurry' f (b, c) = f b c

> curry' :: ((b, c) -> a) -> b -> c -> a
> curry' f b c = f (b, c)

Yes, they remind me of curry and uncurry from Prelude.

1.4-ii. Give a proof of the exponent law that a^b × a^c = a^(b+c).

We saw from the previous exercise that proofs of statements in the type algebra correspond to constructing a function that is equivalent to the statement, and typechecks. In this case, a^b × a^c corresponds to a pair of type (b -> a, c -> a), and a^(b+c) corresponds to a function of type Either b c -> a. To show they are equivalent, we provide functions:

> expLaw1 :: (b -> a, c -> a) -> Either b c -> a
> expLaw1 (toA1, toA2) e = case e of
>                               Left b  -> toA1 b
>                               Right c -> toA2 c

and

> expLaw2 :: (Either b c -> a) -> (b -> a, c -> a)
> expLaw2 toA = (toA . Left, toA . Right)


1.4-iii. Prove (a×b)^c = a^c × b^c.

Similarly, we construct functions:

> anotherLaw1 :: (c -> (a, b)) -> (c -> a, c -> b)
> anotherLaw1 toAB = (fst . toAB, snd . toAB)

> anotherLaw2 :: (c -> a, c -> b) -> c -> (a, b)
> anotherLaw2 (toA, toB) c = (toA c, toB c)
