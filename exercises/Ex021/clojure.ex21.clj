(ns ex21)

; clojure -M ./exercises/Ex021/clojure.ex21.clj
; 31,626

(defn sum-divisors [x]
  (->> (range 1 x)
       (filter #(zero? (mod x %)))
       (reduce +)))

(defn amicable? [x]
  (let [y (sum-divisors x)]
    (and (not= y x)
         (= (sum-divisors y) x))))

(defn main []
  ;(println (sum-divisors 220)) ; 284
  ;(println (sum-divisors 284)) ; 220
  ;(println (amicable? 220))    ; true

  (let [total-sum (->> (range 1 (inc 10000))
                       (filter amicable?)
                       (reduce +))]
    (println total-sum)))

(main)
