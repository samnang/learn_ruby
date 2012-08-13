class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    "%02d:%02d:%02d" % [hours, minutes, seconds]
  end

  def seconds
    @seconds % 60
  end

  def padded(num)
    "%02d" % num
  end

  private

  def hours
    @seconds / 3600
  end

  def minutes
    (@seconds / 60) % 60
  end
end
