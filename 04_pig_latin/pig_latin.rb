VOWELS = %w(a e i o u)
SINGLE_PHONEME = 'qu'

def translate(text)
  words = text.split
  words.map { |word| translate_word(word) }.join(' ')
end

def translate_word(word)
  result = word.dup

  punctuation = result.slice!(-1) if word.match(/[\.,!]$/)

  unless start_with_vowel?(word)
    consonants = consonants_in_beginning_of_word(word)

    result = result[consonants.size..-1]
    result << consonants
  end

  result << 'ay'
  result.capitalize! if capitalized_word?(word)
  result << punctuation.to_s
end

def start_with_vowel?(word)
  VOWELS.include?(word[0])
end

def consonants_in_beginning_of_word(word)
  word.start_with?(SINGLE_PHONEME) ? SINGLE_PHONEME : word[/^[^aeiou\W]+/]
end

def capitalized_word?(word)
  word[0] == word[0].upcase
end
