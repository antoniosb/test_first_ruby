# This class converts seconds to readable time
class Timer
  attr_accessor :seconds
  def initialize
    @seconds ||= 0
  end

  def padded(num)
    num.to_s.split('').size == 1 ? num.to_s.prepend('0') : num.to_s
  end

  def time_string
    h, m, s = 0, 0, @seconds
    while s > 3600
      s -= 3600
      h += 1
    end
    while s > 60
      s -= 60
      m += 1
    end
    "#{padded(h)}:#{padded(m)}:#{padded(s)}"
  end
end
