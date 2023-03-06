require_relative 'lib/film'
require_relative 'lib/film_collection'
require_relative 'lib/film_parser'

collection = FilmCollection.new(FilmParser.from_imdb250_wiki)

if collection.films.empty?
  puts 'Нет доступа к ресурсу'
end

puts 'Программа «Фильм на вечер»'

answer = 0

puts collection
puts
puts 'Фильм какого режиссера вы хотите сегодня посмотреть?'

answer = gets.to_i

loop do
  break if (1..collection.directors.size).include?(answer)

  puts 'Такого режиссера нет, повторите ввод'
  answer = gets.to_i
end

director = collection.directors[answer - 1]
film = collection.films.select { |film| film.director == director }.sample

puts
puts 'И сегодня вечером рекомендую посмотреть:'
puts film
