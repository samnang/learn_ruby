def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(numbers)
  numbers.inject(0, &:+)
end

def multiply(numbers)
  numbers.inject(&:*)
end

def power(number)
  number ** 2
end

def factorial(n)
  return 1 if [0, 1].include?(n)

  n * factorial(n - 1)
end
