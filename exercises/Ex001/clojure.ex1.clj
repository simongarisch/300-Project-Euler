(ns ex1)

; clojure -M clojure.ex1.clj
; 233,168
(defn main []
  (println (reduce + (filter #(or (zero? (mod % 3)) (zero? (mod % 5))) (range 1000))))
)

(main)
