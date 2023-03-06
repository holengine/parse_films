require 'httparty'
require 'nokogiri'

module FilmParser
  extend self

  IMDB250_WIKI_URL = 'https://w.wiki/6PCi'

  def from_imdb250_wiki
    doc = Nokogiri::HTML(HTTParty.get(IMDB250_WIKI_URL).body)

    doc.xpath("//tr").map do |el|
      Film.new(
        el.css('td[2]').text.chomp,
        el.css('td[3]').text.to_i,
        el.css('td[4]').text.chomp
      )
    end.drop(1)

  rescue SocketError
    []
  end
end