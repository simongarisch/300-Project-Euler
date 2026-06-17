(ns ex6)

; clojure -M ./exercises/Ex006/clojure.ex6.clj
; 25,164,150

(defn sum-of-squares [n]
  (->> (range (inc n))
       (map #(* % %))
       (reduce +)))

(defn square-of-sum [n]
  (->> (range (inc n))
       (reduce +)
       (#(* % %))))

(defn main []
  ;(println (sum-of-squares 10)) ; 385
  ;(println (square-of-sum 10))  ; 3025

  (let [sum-squares (sum-of-squares 100)
        square-sum (square-of-sum 100)] 
    (println (- square-sum sum-squares))
    ))

(main)
