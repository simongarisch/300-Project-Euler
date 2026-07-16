(ns ex17
  (:require [clojure.string :as str]))

; clojure -M ./exercises/Ex017/clojure.ex17.clj
; 21,124

(def num2words
  {1 "One", 2 "Two", 3 "Three", 4 "Four", 5 "Five",
   6 "Six", 7 "Seven", 8 "Eight", 9 "Nine", 10 "Ten",
   11 "Eleven", 12 "Twelve", 13 "Thirteen", 14 "Fourteen",
   15 "Fifteen", 16 "Sixteen", 17 "Seventeen", 18 "Eighteen",
   19 "Nineteen", 20 "Twenty", 30 "Thirty", 40 "Forty",
   50 "Fifty", 60 "Sixty", 70 "Seventy", 80 "Eighty",
   90 "Ninety", 0 "Zero"})

(defn get-number-text [num]
  (cond
    ;; Handle exactly 1000
    (= num 1000)
    "One Thousand"

    ;; Handle 0 explicitly
    (= num 0)
    (num2words 0)

    :else
    (let [hundreds (quot num 100)
          remainder (rem num 100)

          hundreds-txt (if (pos? hundreds)
                         (str (num2words hundreds) " Hundred")
                         "")

          tens-ones-txt (cond
                          (zero? remainder)
                          ""

                          (contains? num2words remainder)
                          (num2words remainder)

                          :else
                          (let [tens (* (quot remainder 10) 10)
                                ones (rem remainder 10)]
                            (str (num2words tens) " " (num2words ones))))]

      ;; combine strings with "And"
      (str/trim
       (cond
         (and (not-empty hundreds-txt) (not-empty tens-ones-txt))
         (str hundreds-txt " And " tens-ones-txt)

         (not-empty hundreds-txt)
         hundreds-txt

         :else
         tens-ones-txt)))))

(defn main[]
  ;(println num2words)
  ;(println (get-number-text 1000)) ; One Thousand
  ;(println (get-number-text 999))  ; Nine Hundred And Ninety Nine
  
  (println 
   (->> (range 1 1001)
         (map get-number-text)
         (map #(str/replace % " " ""))
         (map count)
         (reduce +)))
   )

(main)
