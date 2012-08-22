module ArrayExtensions
  def sum
    inject(0, &:+)
  end

  def square
    map{|n| n ** 2}
  end

  def square!
    replace(square)
  end
end

class Array
  include ArrayExtensions
end
