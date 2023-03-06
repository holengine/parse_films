require_relative 'film'

class FilmCollection
  attr_reader :films, :directors

  def initialize(films)
    @films = films
    @directors = films.map(&:director).uniq
  end

  def to_s
    @directors.map.with_index(1) do |director, index|
      "#{index}. #{director}"
    end.join("\n")
  end
end
