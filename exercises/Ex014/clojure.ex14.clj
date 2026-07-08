(ns ex14)

; clojure -M ./exercises/Ex014/clojure.ex14.clj
; 837,799

(defn get-next [n]
  (if (= 0 (mod n 2))
    (/ n 2)
    (inc (* 3 n))))

(defn collatz-seq [start]
  (->> (iterate get-next start)
       (take-while #(not= % 1))
       vec
       (#(conj % 1))))

(defn main []
  ;(println (collatz-seq 13)) ; [13 40 20 10 5 16 8 4 2 1]

  (let [longest-chain (atom 0)
        starting (atom 0)]
    (doseq [i (range 1 1000000)]
      (let [cseq (collatz-seq i)
            terms (count cseq)]
        (when (> terms @longest-chain)
          (reset! longest-chain terms)
          (reset! starting i))))
    (println @starting))
  )

(main)
