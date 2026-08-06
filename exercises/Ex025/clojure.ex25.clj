(ns ex25)

; clojure -M ./exercises/Ex025/clojure.ex25.clj
; 4,782

(defn main [] 
  (loop [fib-index 3
         fib1 1N
         fib2 1N
         fib-value (+' fib1 fib2)]
    (if (< (count (str fib-value)) 1000)
      (recur (inc fib-index)
             fib2
             fib-value
             (+' fib2 fib-value))
      (println fib-index))))

(main)
