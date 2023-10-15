# frozen_string_literal: true

class ImdbScraper
  include HTTParty
  include Nokogiri

  def get_movie_soundtracks(movie_name)
    movie_soundtrack_page = get_movie_soundtrack_page(movie_name)
    response = HTTParty.get(movie_soundtrack_page, headers: { 'User-Agent' => 'Mozilla/5.0' })
    html = Nokogiri::HTML(response.body)
    songs = []
    movie_soundtracks = html.css('.ipc-metadata-list__item--stacked').map do |soundtrack|
      name = soundtrack.css('.ipc-metadata-list-item__label').first.text
      soundtrack.css('.ipc-html-content-inner-div').each do |data|
        if data.text.include?('Performed by')
          artist = data.text.gsub('Performed by', '').gsub('(uncredited)', '').strip
          songs << { name: name.encode("ASCII", invalid: :replace, undef: :replace, replace: ""), artist: artist.encode("ASCII", invalid: :replace, undef: :replace, replace: "") }
        end
      end
    end
    songs
  end

  def get_movie_soundtrack_page(movie_name)
    movie_name = movie_name.gsub(' ', '+')
    url = "https://www.imdb.com/find?q=#{movie_name}&ref_=nv_sr_sm"
    response = HTTParty.get(url, headers: { 'User-Agent' => 'Mozilla/5.0' })
    html = Nokogiri::HTML(response.body)
    movie_url = html.css('.find-title-result a').first['href'].split('?').first
    movie_soundtrack_url = "https://www.imdb.com#{movie_url}soundtrack?ref_=tt_trv_snd"
  end
end