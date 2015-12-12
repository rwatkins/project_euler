(ns euler.problem12)

(defn triangle-numbers []
  (map #(reduce + (range (inc %))) (drop 1 (range))))

(defn find-factors [n]
  (let [root-n (Math/floor (Math/sqrt n))]
    (reduce
      (fn [factors i]
        (if (= 0 (mod n i))
          (-> factors
            (conj i)
            (conj (/ n i)))
          factors))
      (set [1 n])
      (range 2 root-n))))

(defn find-n-factors [n]
  (loop [triangles (triangle-numbers)
         max-factor-count 0]
    (let [i (first triangles)
          factor-count (count (find-factors i))
          new-max (max max-factor-count factor-count)]
      ;; When we find a new largest factor count, print it
      (when (not (= new-max max-factor-count))
        (println (str i " factors: " factor-count)))
      (if (< factor-count n)
        (recur (rest triangles) new-max)
        i))))

(defn run []
  (println "Problem 12")
  (println (find-n-factors 500)))
