# Reverse Polish Notation calculator. Emulates it using a stack based approach
class RPNCalculator
  attr_accessor :value

  def initialize
    @stack = []
  end

  def push(value)
    @stack.push value
  end

  def pop
    @stack.pop
  end

  def plus
    empty?
    if @value.nil?
      @value = pop + pop
    else
      @value += pop
    end
  end

  def minus
    empty?
    if @value.nil?
      @value = -pop + pop
    else
      @value -= pop
    end
  end

  def divide
    empty?
    a = pop
    b = pop
    if @value.nil?
      @value = b / a.to_f
    else
      @value /= a.to_f
    end
  end

  def times
    empty?
    if @value.nil?
      @value = pop * pop
    else
      @value *= pop
    end
  end

  def tokens(param)
    param.split(' ').map { |e| /\d/ =~ e ? e.to_i : e.to_sym }
  end

  def evaluate(param)
    tokens(param).each do |e|
      if e.is_a? Fixnum
        push e
      else
        call_operation_for e
      end
    end
    value
  end

  private

  def empty?
    fail 'calculator is empty' if @stack.empty?
  end

  def call_operation_for(param)
    case param
    when :+
      plus
    when :-
      minus
    when :*
      times
    when :/
      divide
    else
      fail 'Unknown operator.'
    end
  end
end
