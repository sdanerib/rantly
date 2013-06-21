class Integer
  def shrink
    if self < 0 then (self / 2).floor + 1
    elsif self > 0 then (self / 2) - 1
    else
      return 0
    end
  end

  def shrinkable?
    self != 0
  end
end

class String
  def shrink
    if self.size > 0
      idx = Random::rand(self.size)
      shrunk = self.dup
      shrunk[idx] = ""
      return shrunk
    else
      return ""
    end
  end

  def shrinkable?
    self != ""
  end
end

class Array
  def shrink
    idx = find_index{|e| e.shrinkable?}
    if idx != nil
      clone = self.dup
      clone[idx] = clone[idx].shrink
      return clone
    else
      return self
    end
  end

  def shrinkable?
    self.any?{|e| e.shrinkable? }
  end
end
