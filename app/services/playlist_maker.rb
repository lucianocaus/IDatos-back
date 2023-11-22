# frozen_string_literal: true

class PlaylistMaker
  def create_movie_playlist(movie_name, user_token)
    movie_data = ImdbScraper.new.get_movie_soundtracks(movie_name)
    songs = movie_data[:songs]
    raise 'Soundtrack not found' if songs.empty?

    playlist_name = "#{movie_data[:found_movie_name]} Soundtrack"
    playlist_url = Spotify.new.create_playlist_and_add_songs(playlist_name, songs, user_token)
    { url: playlist_url, image: movie_data[:image] }
  end
end
