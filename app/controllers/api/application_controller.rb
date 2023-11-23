# frozen_string_literal: true

module Api
  class ApplicationController < ActionController::API

    rescue_from StandardError, with: :render_error

    def render_error(error)
      render json: { error: error.message }, status: :bad_request
    end
  end
end
