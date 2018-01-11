class Integer
  def to_words
    steps_as_words = {
      1_000_000 => 'million',
      1_000 => 'thousand',
      100 => 'hundred',
      90 => 'ninety',
      80 => 'eighty',
      70 => 'seventy',
      60 => 'sixty',
      50 => 'fifty',
      40 => 'forty',
      30 => 'thirty',
      20 => 'twenty',
      19 => 'nineteen',
      18 => 'eighteen',
      17 => 'seventeen',
      16 => 'sixteen',
      15 => 'fifteen',
      14 => 'fourteen',
      13 => 'thirteen',
      12 => 'twelve',
      11 => 'eleven',
      10 => 'ten',
      9 => 'nine',
      8 => 'eight',
      7 => 'seven',
      6 => 'six',
      5 => 'five',
      4 => 'four',
      3 => 'three',
      2 => 'two',
      1 => 'one'
    }

    word_phrase = ''

    # Loop through the `steps_as_words`, then use recursion to find words for each
    # block of values.
    
    steps_as_words.each do |num, word|
      # The number is 0 - return blank
      return '' if zero?

      # The self is between 1 & 9 and can be divided into num
      # So for example, if self is 8 and num is 8, then we can safely return 'eight'.
      return "#{word_phrase}#{word}" if self < 10 && num == self

      # The self is between 10 & 99
      if self < 100 && (self / num) > 0
        
        # Number has no remainder when divided by num so self is 20, and num is 20.
        return "#{word_phrase}#{word}" if self % num == 0

        # Number has remainder, add this to our string then recursion to find the
        # smaller number
        # For example self could be 22, so weird return the value for 20, then lookup the 2
        return "#{word_phrase}#{word}-#{(self % num).to_words}"
      end

      # We're bigger then 99, so we'll need a conjunction.
      if (self / num) > 0
        return "#{word_phrase}#{(self / num).to_words} #{word} #{'and' if self % num != 0} #{(self % num).to_words}".strip
      end
    end
    
    # Some unknown number, just return the original integer.
    self
  end
end
