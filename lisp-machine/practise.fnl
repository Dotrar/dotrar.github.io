

(print "Hello world")

(print (.. "Hi " (io.read)))


(local data {
    "key" value
    "number" 321
    "func" (fn [x] (+ x 2))}
    )
(print (. data "number"))

(print ((. data "func") 3))

