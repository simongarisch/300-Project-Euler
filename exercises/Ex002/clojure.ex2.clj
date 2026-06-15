(ns ex2)

; clojure -M clojure.ex2.clj
; 4,613,732
(defn main []
    (let [fibs (->> [0 1]
                    (iterate (fn [[a b]] [b (+ a b)]))
                    (map first)
                    (take-while #(<= % 4000000)))]

     (println (reduce + (filter even? fibs)))
    )
)

(main)
