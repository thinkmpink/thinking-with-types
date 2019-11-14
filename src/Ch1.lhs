> module Ch1 (
>              uncurry'
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
