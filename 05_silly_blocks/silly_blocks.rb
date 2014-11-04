def reverser(&block)
  block.call.split.map(&:reverse).join(' ')
end

def adder(param = 1, &block)
  block.call + param
end

def repeater(param = 1)
  param.times do
    yield
  end
end
