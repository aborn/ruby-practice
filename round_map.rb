$roundMap = Hash.new

class RoundMap

  def initialize()
  end

  def put(key, value)
    $roundMap[key] = value
  end

  def get(key)
    return $roundMap[key]
  end
end

if __FILE__ == $0
  rm = RoundMap.new
  rm.put(1, 3)
  print "value = #{rm.get(1)}\n"
end
