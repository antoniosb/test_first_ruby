def translate(word)
  result = ''
  word.split(' ').each do |w|
    result << " #{translate_word w}"
  end
  result.strip
end

def translate_word(word)
  response, vowels, consonants = word.dup, %w(a e i o), ''
  first_letter = word.split('').first
  if vowels.include? first_letter
    return response << 'ay'
  else
    word.split('').each do |letter|
      vowels.include?(letter) ? break : consonants << letter
    end
    return response.delete(consonants).concat(consonants).concat('ay')
  end
end
