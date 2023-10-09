# frozen_string_literal: true

module Api
  class ApplicationController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :authenticate_api_v1_user!, unless: :devise_controller?
  end
end
