# coding: utf-8


class RoundMap
  RoundMapMaxSize = 2 * 1000
  @@roundMap = Hash.new

  def initialize()
  end

  def put(key, value)
    currentIndex = key.divmod(RoundMapMaxSize)[1]   # 取余
    @@roundMap[currentIndex] = value
    for i in 0...RoundMapMaxSize
      if (i - currentIndex).abs >= RoundMapMaxSize/2
        @@roundMap.delete(i)
      end
    end
  end

  def get(key)
    if @@roundMap.has_key?(key)
      return @@roundMap[key]
    end

    return -1
  end
end

if __FILE__ == $0
  rm = RoundMap.new
  print "**** map[0] = #{rm.get(0)} \n"

  for j in 0...5
    p j
  end

  for i in 0...2005
    rm.put(i, i+1)
    if i == 2002
      print "map[0]= #{rm.get(0)}, map[1]= #{rm.get(1)}, map[2]= #{rm.get(2)}, map[3]=#{rm.get(3)} \n"
    end
  end
end
