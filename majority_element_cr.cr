def majority_element(elements)
  counts = elements.inject(Hash(String, Int32).new(0)) do |collector, element|
    collector[element] += 1
    collector
  end

  result = counts.map do |element, count|
    count > elements.count / 2 ? element : nil
  end.compact

  if result.count == 0
    return nil
  elsif result.count == 1
    return result.first
  end

  raise "Multiple elements found!"
end

elements = File.read_lines(ARGV[0]).first.strip.split(",")
puts majority_element(elements)
