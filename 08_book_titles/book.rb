# Class that threat right the Book titles
class Book
  attr_reader :title

  def title=(str)
    str.capitalize!
    little_words = %w(and the a an in of)
    @title = str.split.map do |word|
      if little_words.include?(word)
        word
      else
        word.capitalize
      end
    end.join(' ')
  end
end
