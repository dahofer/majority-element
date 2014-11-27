def majority_element(elements)
  counts = elements.reduce(Hash.new(0)) do |collector, element|
    collector[element] += 1
    collector
  end

  result = counts.select do |key, value|
    value > elements.count / 2
  end.keys

  if result.count == 0
    return nil
  elsif result.count == 1
    return result.first
  end

  raise "Multiple elements found!"
end

elements = File.open(ARGV[0]).readlines.first.strip.split(",")
puts majority_element(elements)
