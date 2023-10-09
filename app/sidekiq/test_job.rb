# frozen_string_literal: true

# This is a test job to test the Sidekiq integration
class TestJob
  include Sidekiq::Job

  def perform
    sleep(10)
    Rails.logger.debug "Hello World"
  end
end
