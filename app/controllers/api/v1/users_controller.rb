# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::ApplicationController
      def index
        render json: { message: "Hello World" }
      end
    end
  end
end
