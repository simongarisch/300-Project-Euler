(ns ex5)

; clojure -M ./exercises/Ex005/clojure.ex5.clj
; 232,792,560

(defn is-n-divisible-to-x?
  "Returns true if a number n is evenly divisible
   by all numbers 1 to x inclusive."
  [n x]
  (every? #(zero? (mod n %)) (range 1 (inc x))))

(defn main []
  ;(println (is-n-divisible-to-x? 2520 10)) ; true
  (loop [n 1]
    (if (is-n-divisible-to-x? n 20)
      (println n)
      (recur (inc n)))))

(main)
