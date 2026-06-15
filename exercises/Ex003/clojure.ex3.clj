(ns ex3)

; clojure -M clojure.ex3.clj
; 6,857

(defn is-prime? [n]
  (cond
    (< n 2) false
    (= n 2) true
    (even? n) false
    :else (not-any? #(zero? (rem n %)) 
                    (range 3 (inc (int (Math/sqrt n))) 2))))

(defn main []
    (def TARGET 600851475143)
    (loop [i (inc (int (Math/sqrt TARGET)))]
      (when (> i 0)
        (if (and (zero? (mod TARGET i)) (is-prime? i))
          (println i)
          (recur (dec i))))))

(main)
