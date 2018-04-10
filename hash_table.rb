require "benchmark"

class MichaelHash
  SIZE = 10000

  attr :table

  def initialize
    @table = Array.new SIZE
  end

  def []= key, value
    @table[hash_index(key)] ||= []
    @table[hash_index(key)] << [key, value]
  end

  # item structure: [key, value]
  def [] key
    if @table[hash_index(key)]
      detected_item = @table[hash_index(key)].detect do |item|
        item.first == key
      end
      detected_item.last
    end
  end

  def keys
    @table.compact.flatten(1).map(&:first)
  end

  private

  def hash_index key
    key % SIZE
  end
end

hash = MichaelHash.new
native_hash = {}
ids = Array.new(rand(10000)) { rand(100000000000) }
ids.each do |id|
  hash[id] = 1
  native_hash[id] = 1
end

puts Benchmark.measure {
  ids.each do |id|
    hash[id]
  end
}

puts Benchmark.measure {
  ids.each do |id|
    native_hash[id]
  end
}

puts Benchmark.measure {
  ids.each do |id|
    ids.detect {|i| i == id}
  end
}

### minimum the nil space.
p hash.table.count {|i| i == nil }
