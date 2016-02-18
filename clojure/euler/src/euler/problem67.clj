(ns euler.problem18
  (:require [clojure.string :refer [split split-lines]]))

(def tree-text (slurp "resources/p067_triangle.txt"))

(defn words [s]
  (split s #" "))

(defn parse-int [s]
  (Integer/parseInt s))

(def tree (->> tree-text
            split-lines
            (mapv words)
            (mapv #(mapv parse-int %))))

(defn max-total-index
  [tree row column]
  (if-let [n (get-in tree [row column])]
    (let [max-parent (max (max-total-index tree (- row 1) column)
                          (max-total-index tree (- row 1) (- column 1)))]
      (+ n max-parent))
    0))

(def max-total-index (memoize max-total-index))

(defn max-total
  [tree]
  (let [row (- (count tree) 1)
        columns (count (get tree row))]
    (apply max (map #(max-total-index tree row %) (range columns)))))

(defn run []
  (println "Problem 18")
  (println (max-total tree)))
