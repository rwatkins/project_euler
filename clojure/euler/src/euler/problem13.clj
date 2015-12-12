(ns euler.problem13
  (:require [euler.problem13-numbers :refer [numbers]]))

(defn run []
  (println "Problem 13")
  (println (apply str (take 10 (str (apply + numbers))))))
