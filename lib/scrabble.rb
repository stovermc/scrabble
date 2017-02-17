class Scrabble

  def score(word)
    word.upcase.chars.map do |letter|
      point_values[letter]
    end.reduce(:+)
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def score_with_multipliers(word, letter_multi, word_multi = 1)
    total = 0

    word.upcase.chars.zip(letter_multi).each do |letter, multiplier|
      total += point_values[letter] * multiplier
    end
    if word.length == 7
      (total + 10) * word_multi
    else
      total * word_multi
    end
  end

  def highest_scoring_word (word_array)
    word_total = {}
    word_array.each do |word|
      if word.length == 7
        return word
      else
        word_total[word] = score(word)
      end
    end

    winner = word_total.max_by { |word, score| score }
    winner[0]
  end
end
