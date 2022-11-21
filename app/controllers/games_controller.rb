require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = [*('A'..'Z')].sample(10).to_a
  end

  def score
    @answer = params['your_word']
    @result = word_check?(@answer)
    @english_word = english_word(@result, @answer)
  end

  def word_check?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def english_word(check, answer)
    if check
      "Congratulations #{answer} is an English word"
    end
  end
end


# @answer.chars.sort.all? { |letter| @grid.include?(letter) }
