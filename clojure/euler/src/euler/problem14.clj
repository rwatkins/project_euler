(ns euler.problem14)

(defn collatz-next [i]
  (if (even? i)
    (/ i 2)
    (+ 1 (* 3 i))))

(defn collatz-sequence [start]
  (loop [chain []
         i start]
    (let [new-chain (conj chain i)]
      (if (= i 1)
        new-chain
        (recur new-chain (collatz-next i))))))

(defn longest-collatz-sequence [under]
  (->> (range 1 (inc under))
    (map (fn [i]
           (let [cseq (collatz-sequence i)]
             {:n i
              ;:sequence cseq
              :count (count cseq)})))
    (sort-by :count)
    reverse
    first
    ))

(defn run []
  (println "Problem 14 xxxxx")
  (println (longest-collatz-sequence 1000000)))
