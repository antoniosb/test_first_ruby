# Added a method that reads the number
class Fixnum
  def in_words
    Words.number_to_word(self)
  end
end

# Helper module to hold all the implementation of reading numbers
module Words
  class << self
    def one_digits
      { '0' => 'zero', '1' => 'one', '2' => 'two', '3' => 'three',
        '4' => 'four', '5' => 'five', '6' => 'six', '7' => 'seven',
        '8' => 'eight', '9' => 'nine' }
    end

    def ten_elev_twelv
      { '10' => 'ten', '11' => 'eleven', '12' => 'twelve' }
    end

    def two_digits_h
      { '3' => 'thir', '4' => 'four', '5' => 'fif',
        '6' => 'six', '7' => 'seven', '8' => 'eigh', '9' => 'nine' }
    end

    def tens
      { '2' => 'twen', '4' => 'for' }
    end

    def number_to_word(number)
      num = number.to_s.split('')
      case num.size
      when 1 then one_digits[num[0]]
      when 2 then two_digits(number)
      when 3 then three_digits(number)
      when 4..6 then more_digits(number, 1_000, 'thousand')
      when 7..9 then more_digits(number, 1_000_000, 'million')
      when 10..12 then more_digits(number, 1_000_000_000, 'billion')
      when 12..15 then more_digits(number, 1_000_000_000_000, 'trillion')
      else fail "Don't know how to say this number"
      end
    end

    def two_digits(num)
      return one_digits[num.to_s.slice(1..-1)] if num < 10
      num_s = num.to_s.split('')
      if ten_elev_twelv.keys.include? num.to_s # 10,11,12
        ten_elev_twelv[num.to_s]
      elsif num % 10 == 0 # 20,30..90
        (tens[num_s[0]] || two_digits_h[num_s[0]]) + 'ty'
      elsif num < 20 # 13...19
        two_digits_h[num_s[1]] + 'teen'
      else
        first = (num / 10).to_s
        second = (num % 10).to_s
        (tens[first] || two_digits_h[first]) + 'ty ' + one_digits[second]
      end
    end

    def three_digits(num)
      return two_digits(num) if num < 100
      if num % 100 == 0 # 100,200..900
        round_hundreds(num)
      else
        second = (num % 100)
        round_hundreds(num) + ' ' + two_digits(second)
      end
    end

    def round_hundreds(num)
      first = (num / 100).to_s
      one_digits[first] + ' hundred'
    end

    def more_digits(number, divisor, word)
      num = number / divisor
      rest = number % divisor
      if rest == 0
        build_more_digits(num, word)
      else
        build_more_digits(num, word) + ' ' + number_to_word(rest)
      end
    end

    def build_more_digits(number, word)
      number_s = number.to_s.split('')
      if number_s.size == 1
        one_digits[number_s[0]] + " #{word}"
      elsif number_s.size == 2
        two_digits(number) + " #{word}"
      elsif number_s.size == 3
        three_digits(number) + " #{word}"
      end
    end
  end
end
