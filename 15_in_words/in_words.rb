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
      if num.size == 1
        one_digits[num[0]]
      elsif num.size == 2
        two_digits(number)
      elsif num.size == 3
        three_digits(number)
      elsif num.size > 3 && num.size <= 6
        thousands(number)
      elsif num.size > 6 && num.size <= 9
        millions(number)
      elsif num.size > 9 && num.size <= 12
        billions(number)
      elsif num.size > 12 && num.size <= 15
        trillions(number)
      end
      # ... and so on. It this momment I'm sorry for this impl.
      # Maybe metaprogramming would help here ;~
    end

    def two_digits(num)
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

    def thousands(num)
      thousand = num / 1000
      rest = num % 1000
      if rest == 0
        thousand_miles(thousand)
      else
        thousand_miles(thousand) + ' ' + three_digits(rest)
      end
    end

    def thousand_miles(thousand)
      thousand_s = thousand.to_s.split('')
      if thousand_s.size == 1
        one_digits[thousand_s[0]] + ' thousand'
      elsif thousand_s.size == 2
        two_digits(thousand) + ' thousand'
      elsif thousand_s.size == 3
        three_digits(thousand) + ' thousand'
      end
    end

    def millions(num)
      millions = num / 1_000_000
      rest = num % 1_000_000
      if rest == 0
        million_miles(millions)
      else
        million_miles(millions) + ' ' + number_to_word(rest)
      end
    end

    def million_miles(million)
      million_s = million.to_s.split('')
      if million_s.size == 1
        one_digits[million_s[0]] + ' million'
      elsif million_s.size == 2
        two_digits(million) + ' million'
      elsif million_s.size == 3
        three_digits(million) + ' million'
      end
    end

    def billions(num)
      billion = num / 1_000_000_000
      rest = num % 1_000_000_000
      if rest == 0
        billion_miles(billion)
      else
        billion_miles(billion) + ' ' + number_to_word(rest)
      end
    end

    def billion_miles(billion)
      billion_s = billion.to_s.split('')
      if billion_s.size == 1
        one_digits[billion_s[0]] + ' billion'
      elsif billion_s.size == 2
        two_digits(billion) + ' billion'
      elsif billion_s.size == 3
        three_digits(billion) + ' billion'
      end
    end

    def trillions(num)
      trillion = num / 1_000_000_000_000
      rest = num % 1_000_000_000_000
      if rest == 0
        trillion_miles(trillion)
      else
        trillion_miles(trillion) + ' ' + number_to_word(rest)
      end
    end

    def trillion_miles(trillion)
      trillion_s = trillion.to_s.split('')
      if trillion_s.size == 1
        one_digits[trillion_s[0]] + ' trillion'
      elsif trillion_s.size == 2
        two_digits(trillion) + ' trillion'
      elsif trillion_s.size == 3
        three_digits(trillion) + ' trillion'
      end
    end
  end
end
