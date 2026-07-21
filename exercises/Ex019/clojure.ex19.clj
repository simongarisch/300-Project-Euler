(ns ex19)

(import '[java.time LocalDate DayOfWeek])

; clojure -M ./exercises/Ex019/clojure.ex19.clj
; 171

(defn first-of-month-sundays [start end]
  (->> (iterate #(.plusDays % 1) start)
       (take-while #(not (.isAfter % end)))
       (filter #(and (= 1 (.getDayOfMonth %))
                     (= DayOfWeek/SUNDAY (.getDayOfWeek %))))
       count))

(defn main []
  (let [start-date (LocalDate/of 1901 1 1)
        end-date   (LocalDate/of 2000 12 31)]
    (println (first-of-month-sundays start-date end-date))))

(main)