(ns ex10)

; clojure -M ./exercises/Ex010/clojure.ex10.clj
; 142,913,828,922

(defn is-prime? [n]
  (cond
    (< n 2) false
    (= n 2) true
    (even? n) false
    :else (not-any? #(zero? (rem n %))
                    (range 3 (inc (int (Math/sqrt n))) 2))))

(def result
  (->> (range 2000000)
       (filter is-prime?)
       (reduce +)))

(defn main []
  (println result)
  )

(main)