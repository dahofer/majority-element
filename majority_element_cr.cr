def majority_element(elements)
  counts = elements.each_with_object(Hash(String, Int32).new(0)) do |element, collector|
    collector[element] += 1
    collector
  end

  result = counts.map do |element, count|
    count > elements.size / 2 ? element : nil
  end.compact

  if result.size == 0
    return nil
  elsif result.size == 1
    return result.first
  end

  raise "Multiple elements found!"
end

elements = File.read_lines(ARGV[0]).first.strip.split(",")
puts majority_element(elements)
