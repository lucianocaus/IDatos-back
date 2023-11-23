# frozen_string_literal: true

Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :spotify, only: [] do
        collection do
          post :create_playlist
        end
      end
    end
  end
end
