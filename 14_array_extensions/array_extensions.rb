# Opening Array class and adding extensions methods
class Array
  def sum
    self.empty? ? 0 : reduce(:+)
  end

  def square
    self.empty? ? self : map { |x| x**2 }
  end

  def square!
    map! { |x| x**2 }
  end
end
