(ns euler.problem17
  (:require [clojure.string :refer [join replace]]))

(def word-map
  {1 "one"
   2 "two"
   3 "three"
   4 "four"
   5 "five"
   6 "six"
   7 "seven"
   8 "eight"
   9 "nine"
   10 "ten"
   11 "eleven"
   12 "twelve"
   13 "thirteen"
   14 "fourteen"
   15 "fifteen"
   16 "sixteen"
   17 "seventeen"
   18 "eighteen"
   19 "nineteen"
   20 "twenty"
   30 "thirty"
   40 "forty"
   50 "fifty"
   60 "sixty"
   70 "seventy"
   80 "eighty"
   90 "ninety"
   1000 "one thousand"
   })

(defn number-word [number]
  (cond
    (contains? word-map number) (get word-map number)
    (<= 100 number) (let [word-int (int (/ number 100))
                          word-str (get word-map word-int)]
                      (join " and "
                            (filter identity 
                                    [(str word-str " hundred")
                                     (number-word (mod number 100))])))
    (<= 10 number) (let [word-int (* 10 (int (/ number 10)))
                         word-str (get word-map word-int)]
                     (str word-str " " (number-word (mod number 10))))))

(defn run []
  (println "Problem 17")
  (println (-> (apply str (map number-word (range 1 1001)))
             (replace #"\s+" "")
             count)))
