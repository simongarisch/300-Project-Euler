(ns ex15)

; clojure -M ./exercises/Ex015/clojure.ex15.clj
; 137,846,528,820N

(def size 20)

(defn solution1 [] 
  (let [choices (atom 1N)]
  (doseq [i (range 1 (inc size))]
    (reset! choices (* @choices (bigint (- (* 2 size) (- size i)))))
    (reset! choices (/ @choices (bigint i))))
  (println @choices)))

(defn solution2 [] 
(let [total-paths (reduce (fn [choices i]
                             (-> choices
                                 (* (- (* 2 size) (dec i)))
                                 (/ i)))
                           1N
                           (range 1 (inc size)))]
   (println total-paths)))

(defn main []
  (solution1)
  (solution2)
  )

(main)