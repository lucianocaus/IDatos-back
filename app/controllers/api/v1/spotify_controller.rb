# frozen_string_literal: true

module Api
  module V1
    class SpotifyController < Api::ApplicationController
      def create_playlist
        playlist_data = PlaylistMaker.new.create_movie_playlist(params[:movie_name], params[:access_token])
        render json: { playlist: playlist_data[:uri], image: playlist_data[:image] }
      end
    end
  end
end
