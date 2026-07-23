(ns ex22)

; clojure -M ./exercises/Ex022/clojure.ex22.clj
; 871,198,282

(require '[clojure.java.io :as io]
         '[clojure.string :as str])


(defn clean-name [s]
  (-> s str/trim str/lower-case (str/replace "\"" "")))


(defn get-names [] 
  (let [dire-path (.getParent (clojure.java.io/file *file*))
        file-path (io/file dire-path "names.txt") 
        contents  (slurp file-path) 
        names     (->> (str/split contents #",")
                       (map clean-name)
                       sort
                       vec)]
    names)
  )

(def scores-mapping
  (zipmap (map char (range (int \a) (inc (int \z))))
          (iterate inc 1)))

(defn get-name-score [name]
  (reduce + (map scores-mapping name)))

(defn main []
  ;(println (get-names))
  ;(println scores-mapping)
  ;(println (get-name-score "colin")) ; 53 

(->> (get-names)
     (map-indexed (fn [idx name]
                    (* (inc idx) (get-name-score name))))
     (reduce +)
     println)
  )

(main)
