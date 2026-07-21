(ns ex20)

; clojure -M ./exercises/Ex020/clojure.ex20.clj
; 648

(defn factorial [n]
  (reduce *' (range 1 (inc n))))

(defn sum-digits [n]
  (->> (str n)
       (map #(Character/digit % 10))
       (reduce +)))

(defn main []
  (println (sum-digits (factorial 100))))

(main)
