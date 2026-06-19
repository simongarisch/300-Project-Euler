(ns ex7)

; clojure -M ./exercises/Ex007/clojure.ex7.clj
; 104,743

(defn is-prime? [n]
  (cond
    (< n 2) false
    (= n 2) true
    (even? n) false
    :else (not-any? #(zero? (rem n %))
                    (range 3 (inc (int (Math/sqrt n))) 2))))

(defn main []
  (let [number (atom 0)
        counter (atom 0)]
    (while (< @counter 10001)
      (swap! number inc)
      (when (is-prime? @number)
        (swap! counter inc)
        )
      )
    (println @number)))

(main)
