def add(this, that)
  this + that
end

def subtract(this, that)
  this - that
end

def sum(ary)
  ary.empty? ? 0 : ary.reduce(:+)
end

def multiply(*args)
  args.reduce(1, :*)
end

def power(this, that)
  result = 1
  that.times do
    result *= this
  end
  result
end

def factorial(num)
  return 1 if num < 2
  num * factorial(num - 1)
end
