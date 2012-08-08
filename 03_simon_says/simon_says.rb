def echo(text)
  text
end

def shout(text)
  text.upcase
end

def repeat(text, time=2)
  (1..time).map{|_| text} * ' '
end

def start_of_word(word, n)
  word[0, n]
end

def first_word(text)
  text.split.first
end

LITTLE_WORDS = %w(and over the)
def titleize(text)
  text.capitalize.gsub(/\w+/) {|s| LITTLE_WORDS.include?(s) ? s : s.capitalize }
end
