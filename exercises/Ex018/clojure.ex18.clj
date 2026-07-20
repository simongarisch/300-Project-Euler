(ns ex18)

(require '[clojure.string :as str])
(require '[clojure.java.io :as io])

; clojure -M ./exercises/Ex018/clojure.ex18.clj
; 1,074

(defn parse-triangle [filepath]
  (->> (slurp filepath)
       (str/split-lines)
       (mapv (fn [line]
               (->> (str/split (str/trim line) #"\s+")
                    (mapv #(Long/parseLong %)))))))

(def current-dir (.getParent (io/file *file*)))

(defn file-relative-to-src [relative-path]
  (io/file current-dir relative-path))

(defn step-up [lower-row upper-row]
  (->> (partition 2 1 lower-row)
       (map (fn [[left right]] (max left right)))
       (mapv + upper-row)))

(defn main []
  (let [file-path (file-relative-to-src "triangle.txt")
        triangle (parse-triangle file-path)
        result (first (reduce step-up (rseq triangle)))]
     (println result)))

(main)
