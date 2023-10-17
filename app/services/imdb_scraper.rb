# frozen_string_literal: true

class ImdbScraper
  include HTTParty
  include Nokogiri

  def get_movie_soundtracks(movie_name)
    movie_data = get_movie_soundtrack_page(movie_name)
    movie_soundtrack_page = movie_data[:movie_soundtrack_url]
    response = HTTParty.get(movie_soundtrack_page, headers: { 'User-Agent' => 'Mozilla/5.0' })
    html = Nokogiri::HTML(response.body)
    songs = []
    html.css('.ipc-metadata-list__item--stacked').map do |soundtrack|
      name = soundtrack.css('.ipc-metadata-list-item__label').first.text
      soundtrack.css('.ipc-html-content-inner-div').each do |data|
        if data.text.include?('Performed by')
          artist = data.text.gsub('Performed by', '').gsub('(uncredited)', '').strip
          songs << { name: name.encode("ASCII", invalid: :replace, undef: :replace, replace: ""), artist: artist.encode("ASCII", invalid: :replace, undef: :replace, replace: "") }
        end
      end
    end
    image = html.css('.ipc-image').first['src']
    { songs: songs, found_movie_name: movie_data[:found_movie_name], image: image }
  end

  def get_movie_soundtrack_page(movie_name)
    movie_name = movie_name.gsub(' ', '+')
    url = "https://www.imdb.com/find?q=#{movie_name}&ref_=nv_sr_sm"
    response = HTTParty.get(url, headers: { 'User-Agent' => 'Mozilla/5.0' })
    html = Nokogiri::HTML(response.body)
    a_tag = html.css('.find-title-result a')
    raise 'Movie not found' if html.css('.find-title-result a').empty?

    movie_url = a_tag.first['href'].split('?').first
    found_movie_name = a_tag.first.text
    movie_soundtrack_url = "https://www.imdb.com#{movie_url}soundtrack?ref_=tt_trv_snd"
    { movie_soundtrack_url: movie_soundtrack_url, found_movie_name: found_movie_name }
  end
end
