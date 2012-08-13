LITTLE_WORDS = %w(a an and in of the)

class Book
  attr_accessor :title

  def title
    @title.capitalize.gsub(/\w+/) {|s| LITTLE_WORDS.include?(s) ? s : s.capitalize }
  end
end
