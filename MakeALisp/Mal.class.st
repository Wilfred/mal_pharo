"
I am a Make-A-Lisp (MAL) interpreter.

You can use me from a CLI (see MalStep) or see:

  Mal demo.

for an example of running.
"
Class {
	#name : #Mal,
	#superclass : #Object,
	#category : #MakeALisp
}

{ #category : #evaluating }
Mal class >> demo [
	| val |
	val := Mal read: '(/ (+ 5 6) 2)'.
	^ val evalIn: MalContext default
]

{ #category : #evaluating }
Mal class >> eval: aForm in: ctx [
	^ aForm evalIn: ctx
]

{ #category : #'as yet unclassified' }
Mal class >> prelude [
	^ '(do 
(def! not (fn* (a) (if a false true)))
(def! load-file (fn* (f) (eval (read-string (str "(do " (slurp f) "\n)")))))
(defmacro! cond
  (fn* (& xs)
       (if (> (count xs) 0)
           (list ''if
                 (first xs)
                 (if (> (count xs) 1) (nth xs 1) (throw "odd number of forms to cond"))
                 (cons ''cond (rest (rest xs)))))))

(def! *host-language* "pharo")

(def! inc (fn* [x] (+ x 1)))
(def! gensym (let* [counter (atom 0)] (fn* [] (symbol (str "G__" (swap! counter inc))))))
(defmacro! or
  (fn* (& xs)
       (if (empty? xs)
           nil
         (if (= 1 (count xs))
             (first xs)
           (let* (condvar (gensym))
             `(let* (~condvar ~(first xs))
                (if ~condvar ~condvar (or ~@(rest xs)))))))))

(def! *ARGV* nil)
	)'
]

{ #category : #printing }
Mal class >> print: aValue [
	^ aValue asReadableString
]

{ #category : #'meta-object-protocol' }
Mal class >> read: aString [
	^ MalReader readString: aString
]

{ #category : #'as yet unclassified' }
Mal class >> rep: aString [
	^ self rep: aString in: MalContext default
]

{ #category : #'as yet unclassified' }
Mal class >> rep: aString in: env [
	^ self print: (self eval: (self read: aString) in: env)
]
