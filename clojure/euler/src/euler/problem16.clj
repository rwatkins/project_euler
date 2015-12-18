(ns euler.problem16)

;(defn floor [& args]
;  (apply #(Math/floor %) args))

;(defn times2 [v]
;  (loop [v (vec v)
;         remainder 0
;         position 0]
;    (if-let [i (get v position)]
;      (recur (assoc v position (-> i (* 2) (mod 10) (+ remainder)))
;             (-> i (* 2) (/ 10) int)
;             (inc position))
;      v)))

;(defn get-number [exp]
;  (loop [i exp
;         v (concat [1] (take 1000 (repeat 0)))]
;    (if (= 0 i)
;      v
;      (recur (dec i) (times2 v)))))

(defn digit [c]
  (Character/digit c 10))

(defn run []
  (println "Problem 16")
  (println (apply + (map digit (-> (iterate #(* % 2) 1N) (nth 1000) str)))))
