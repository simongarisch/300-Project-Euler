(ns ex9)

; clojure -M ./exercises/Ex009/clojure.ex9.clj
; 31,875,000

(defn is-pythagorean-triplet? [a b c]
  (and (< a b c)
       (= (+ (* a a) (* b b)) (* c c))))

(def product
  (first
   (for [a (range 1 1000)
         b (range (inc a) 1000)
         :let [c (- 1000 a b)]
         :when (is-pythagorean-triplet? a b c)]
     (* a b c))))

(defn main []
  ;(println (is-pythagorean-triplet? 1 2 3)) ; false
  ;(println (is-pythagorean-triplet? 3 4 5)) ; true
  (println product)
  )

(main)
