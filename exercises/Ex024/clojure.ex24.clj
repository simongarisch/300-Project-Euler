(ns ex24)

(require '[clojure.math.combinatorics :as combo]
         '[clojure.string :as str])

; clojure -M ./exercises/Ex024/clojure.ex24.clj
; 2,783,915,460

(defn main [] 
  (let [digits (map str (range 10))
        combs  (->> (combo/permutations digits)
                    (map #(Long/parseLong (str/join %)))
                    sort)]
    (println (nth combs (dec 1000000))))
  )

(main)
