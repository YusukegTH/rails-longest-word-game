class GamesController < ApplicationController
  def new
    @letters = 10.times.map { ('A'..'Z').to_a.sample }
  end

  def score
    @score = 1
    grid = params[:grid].to_a
    params[:try].upcase!.chars.each { |letter|
      grid.include?(letter) ? grid.delete_at(grid.find_index(letter)) : @score = 0
    }
    test = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/:#{params[:grid]}").read)["found"]
    if score == 1 && test
      @score = 2
    else

    end
  end
end
