def echo(what)
  what
end

def shout(what)
  what.upcase
end

def repeat(what, rep = 2)
  result = ''
  rep.times do
    result << " #{what}"
  end
  result.strip
end

def start_of_word(word, size)
  word.slice(0, size)
end

def first_word(phrase)
  phrase.split.first
end

def titleize(str)
  str.capitalize!
  little_words = %w(and the over)
  str.split.map do |word|
    if little_words.include?(word)
      word
    else
      word.capitalize
    end
  end.join(' ')
end
