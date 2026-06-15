(ns ex4
  (:require [clojure.string :as str]))

; clojure -M ./exercises/Ex004/clojure.ex4.clj
; 906,609

(defn is-palindromic-number?
  "Returns true if n is a plindromic number, false otherwise.
   Palindromic numbers read the same both ways e.g. 101 or 9119.
  "
  [n]
  (let [s (str n)
        sr (str/reverse (str n))]
    (if (= s sr) true false)
  )
)

(defn main []
  (let [largest (atom 0)
        result (atom 0)]
    (doseq [i (range 100 1000)]
      (doseq [j (range 100 1000)]
        (reset! result (* i j))
        (when (and (is-palindromic-number? @result) (> @result @largest))
          (reset! largest @result))))
     (println @largest)
    ))

(main)
