(ns ex16)

; clojure -M ./exercises/Ex016/clojure.ex16.clj
; 1,366


(defn main []
  (let [n (.pow (BigInteger/valueOf 2) 1000)
        strn (str n)
        result (->> strn
                    (map #(Character/digit % 10))
                    (apply +))]
    (println result)
    )
  )

(main)
