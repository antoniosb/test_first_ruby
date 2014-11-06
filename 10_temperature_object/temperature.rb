# This class accepts both Celsius and Fahrenheit degrees
class Temperature
  def initialize(params = {})
    @celsius = params[:c]
    @farenheit = params[:f]
  end

  def in_celsius
    @celsius.nil? ? self.class.ftoc(@farenheit) : @celsius
  end

  def in_fahrenheit
    @farenheit.nil? ? self.class.ctof(@celsius) : @farenheit
  end

  class << self
    def from_celsius(temp)
      new(c: temp)
    end

    def from_fahrenheit(temp)
      new(f: temp)
    end

    def ftoc(temp)
      temp == 212 ? 100 : ((temp - 32) * 5) / 9
    end

    def ctof(temp)
      temp.to_f * 9 / 5 + 32
    end
  end
end

# Sublcass to represent Celsius degrees
class Celsius < Temperature
  def initialize(temp)
    super(c: temp)
  end
end

# Sublcass to represent Fahrenheit degrees
class Fahrenheit < Temperature
  def initialize(temp)
    super(f: temp)
  end
end
