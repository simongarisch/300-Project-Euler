(ns ex23)

; clojure -M ./exercises/Ex023/clojure.ex23.clj
; 4,179,871

(def limit 28123)

(defn get-sum-proper-divisors [x]
  (reduce + (filter #(zero? (mod x %))
                    (range 1 (inc (quot x 2))))))

(defn get-abundant-numbers [x]
  (vec (filter #(> (get-sum-proper-divisors %) %)
               (range 1 (inc x)))))

(def abundant-sums
  (let [abundant-numbers (get-abundant-numbers limit)]
    (->> abundant-numbers
         (map-indexed (fn [idx a]
                        (for [b     (drop idx abundant-numbers)
                              :let  [sum (+ a b)]
                              :while (<= sum limit)]
                          sum)))
         (apply concat)
         set)))

(def answer
  (reduce + (remove abundant-sums (range 1 (inc limit)))))

(defn main []
  ;(println (get-sum-proper-divisors 28)) ; 28
  ;(println (get-abundant-numbers 100))  ; [12 18 20 24 30 ...
  (println answer)
  )

(main)
