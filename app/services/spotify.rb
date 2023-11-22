# frozen_string_literal: true

class Spotify
  require 'rest-client'
  require 'json'

  def create_playlist_and_add_songs(playlist_name, songs, user_token)
    playlist_data = create_playlist(playlist_name, user_token)
    songs.each do |song|
      add_song_to_playlist(song[:name], song[:artist], playlist_data[:id], user_token)
    end
    playlist_data[:uri]
  end

  def add_song_to_playlist(song_name, artist_name, playlist_id, user_token)
    song_id = get_song_spotify_id(song_name, artist_name, user_token)
    auth = { "Authorization": "Bearer #{user_token}" }
    endpoint = RestClient.post("https://api.spotify.com/v1/playlists/#{playlist_id}/tracks?uris=spotify%3Atrack%3A#{song_id}", {}, headers=auth)
  end

  def create_playlist(playlist_name, user_token)
    auth = { "Authorization": "Bearer #{user_token}" }
    playlist_info = {
      name: playlist_name,
      description: "Created by the Movie Soundtrack amazing app"
    }
    endpoint = RestClient.post("https://api.spotify.com/v1/users/#{get_user_data(user_token)["id"]}/playlists", playlist_info.to_json, headers=auth)
    data = JSON.parse(endpoint)
    { id: data["id"], uri: data["uri"] }
  end

  def get_user_data(user_token)
    auth = { "Authorization": "Bearer #{user_token}" }
    endpoint = RestClient.get("https://api.spotify.com/v1/me", headers=auth)
    JSON.parse(endpoint)
  end

  def get_song_spotify_id(song_name, artist_name, user_token)
    auth = { "Authorization": "Bearer #{user_token}" }
    song_name = song_name.gsub(" ", "%20")
    artist_name = artist_name.gsub(" ", "%20")
    endpoint = RestClient.get("https://api.spotify.com/v1/search?q=#{song_name}%20#{artist_name}&type=track&limit=10&offset=0", headers=auth)
    data = JSON.parse(endpoint)
    data["tracks"]["items"][0]["id"]
  end

  def generate_auth_url
    "https://accounts.spotify.com/authorize?client_id=#{ENV['SPOTIFY_CLIENT_ID']}&redirect_uri=http%3A%2F%2Flocalhost%3A5173%2F&scope=user-read-private%20user-read-email%20playlist-modify-public&response_type=token&state=123".html_safe
  end
end
