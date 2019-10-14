# Make A Lisp

An implementation of [MAL](https://github.com/kanaka/mal) using [Pharo
Smalltalk](http://pharo.org/).

This implementation is almost complete, and passes the self-hosting
MAL test suite.

## Code Organisation

### Steps

Most MAL implementation have a shared library of functionality, then a
different step1, step2 etc file with an increasingly complex `MAL`
class.

Smalltalk is image oriented, so all the code is stored
together. Maintaining 10 different images would be very cumbersome, so
I've used the same implementation for all the steps.

### `EVAL`

MAL convention is to implement evaluation using an `EVAL` function
that switches on the name of special forms, and an `eval_ast` function
that switches on the runtime type (symbol, list, etc).

Smalltalk strongly prefers dynamic dispatch here. See the `evalIn:`
method on `MalList` for evaluation logic.

### Tail-call Optimisation

Smalltalk allocates stack frames on the heap. You can't get stack
overflows: if you infinitely recurse you will eventually OOM instead.

Looking at the `sum2` function from `step5_tco.mal`:

```
(def! sum2
    (fn* (n acc)
         (if (= n 0)
             acc
             (sum2 (- n 1) (+ n acc)))))
```

TCO means this function uses O(1) stack, whereas this implementation
uses O(N) stack. The function is still O(N) in both cases if you allow
arbitrary size numbers.

Smalltalk favours letting the stack grow: the built-in implementation
of factorial is a simple recursive function.

This implementation therefore doesn't implement TCO, but still passes
the TCO tests. I think it makes the code more readable and
definitely helps keep stack traces useful, but it feels like a slight
cheat.

## License

Licensed under MPL 2.0 (Mozilla Public License 2.0), consistent with
the other MAL implementations.
