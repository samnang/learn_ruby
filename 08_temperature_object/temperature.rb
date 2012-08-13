class Temperature
  def initialize(args={})
    @celsius, @fahrenheit = args.values_at(:c, :f)
  end

  class << self
    def from_celsius(degree)
      new(:c => degree)
    end
    alias :ftoc :from_celsius 

    def from_fahrenheit(degree)
      new(:f => degree)
    end
    alias :ctof :from_fahrenheit
  end

  def in_fahrenheit
    @fahrenheit || (@celsius * (9 / 5.0)) + 32
  end

  def in_celsius
    @celsius || (@fahrenheit - 32) * (5 / 9.0)
  end
end

class Celsius < Temperature
  def initialize(degree)
    @celsius = degree
  end
end

class Fahrenheit < Temperature
  def initialize(degree)
    @fahrenheit = degree
  end
end
