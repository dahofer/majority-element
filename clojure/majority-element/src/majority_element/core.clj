(ns majority-element.core
  (:gen-class))

(require '[clojure.string :as str])

(defn parse-elements
  "Parses the elements in the first line of a CSV file"
  [filename]
  (map read-string (str/split (slurp filename) #","))
  )

(defn add-or-increment
  "Given a map and an element, looks up the element in the map.  If the element isn't present, adds it with a value of 1, otherwise increments the existing value."
  [element-map element]
  (if (get element-map element)
    (update-in element-map [element] inc)
    (assoc element-map element 1)
    )
  )

(defn majority-element
  "Given an input list of integers, returns either the one that occurs greater than 50% of the time in the list if it exists, otherwise nil."
  [elements]
  (def count-map (reduce add-or-increment {} elements))
  (def result (filter (fn [[k v]] (> v (/ (count elements) 2))) count-map))
  (first (keys result))
  )

(defn -main
  "Finds the majority element of a list of elements (one occurring > 50% of the time in the list), if one exists."
  [& args]
  (println (majority-element (parse-elements (first args))))
  )
