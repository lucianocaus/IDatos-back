# frozen_string_literal: true

Rails.application.routes.draw do
  require "sidekiq/web"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for "User", at: "auth"
      resources :users, only: [:index]
    end
  end

  Rails.application.routes.draw do
    mount Sidekiq::Web => "/sidekiq"
  end
end
