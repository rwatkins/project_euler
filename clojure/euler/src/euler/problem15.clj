(ns euler.problem15
  (:require [clojure.walk :as walk]))

;(defn paths [[x y]]
;  (merge {}
;    (when (< x max-x)
;      {(str (inc x) "," y) (paths [(inc x) y])})
;    (when (< y max-y)
;      {(str x "," (inc y)) (paths [x (inc y)])})))

;(defn paths2 [[x y] grid-size]
;  (let [leaves (atom 0)]
;    (do
;     ((fn f [x y]
;        (if (and (= x grid-size) (= y grid-size))
;          (do
;            (swap! leaves inc)
;            (let [l @leaves]
;              (when (= 0 (mod l 100000000))
;                (println l))))
;          (do
;            (when (< x grid-size) (f (inc x) y))
;            (when (< y grid-size) (f x (inc y))))))
;        x y)
;      @leaves)))

;(defn count-leaves [tree]
;  (let [leaves (atom 0)]
;    (do
;      (walk/postwalk
;        #(when (and
;                 (not (instance? String %))
;                 (empty? %))
;           (swap! leaves inc))
;        tree)
;      @leaves)))

;(defn mark-leaves [tree]
;  (flatten
;    (for [[k v] tree]
;      (if (empty? v)
;        1
;        (mark-leaves v)))))

;(defn count-paths [x y]
;  (if (or (= x 0) (= y 0))
;    1
;    (+ (count-paths (dec x) y)
;       (count-paths x (dec y)))))

(defn factorial [n]
  (if (= n 1)
    1
    (* (bigint n) (factorial (dec n)))))

(defn paths4 [grid-size]
  (/ (factorial (* 2 grid-size))
     (Math/pow (factorial grid-size) 2)))

(defn run []
  (println "Problem 15")
  (println (paths4 20)))
