def measure(param = 1)
  curr = 0.0
  param.times do
    init = Time.now
    yield if block_given?
    curr += Time.now - init
  end
  curr / param
end
