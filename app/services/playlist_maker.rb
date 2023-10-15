# frozen_string_literal: true

class PlaylistMaker

  def create_movie_playlist(movie_name, user_token)
    songs = ImdbScraper.new.get_movie_soundtracks(movie_name)
    playlist_name = "#{movie_name} Soundtrack"
    Spotify.new.create_playlist_and_add_songs(playlist_name, songs, user_token)
  end
end