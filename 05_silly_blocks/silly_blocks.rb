def reverser
  yield.split.map(&:reverse).join(" ")
end

def adder(value=nil)
  yield + (value || 1)
end

def repeater(n=1)
  n.times { yield }
end
