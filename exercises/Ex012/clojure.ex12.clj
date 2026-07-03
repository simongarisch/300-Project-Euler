(ns ex12)

; clojure -M ./exercises/Ex012/clojure.ex12.clj
; 76,576,500

(def triangle-numbers
  (reductions + (iterate inc 1)))

(defn divisors [n]
  (if (<= n 0)
    []
    (let [limit (int (Math/sqrt n))]
      (->> (range 1 (inc limit))
           (filter #(zero? (mod n %)))
           (mapcat #(if (= % (/ n %)) [%] [% (/ n %)]))
           sort))))

(defn main []
  ;(println (take 5 triangle-numbers)) ; => (1 3 6 10 15)
  ;(println (divisors 28)) ; => (1 2 4 7 14 28)
  
  (let [result (first (filter (fn [n] (> (count (divisors n)) 500)) triangle-numbers))]
     (println result))
  )

(main)
