require "instagram"

module Ruboty
  module Instagram
    module Actions
      class Instagram < Ruboty::Actions::Base
        def initialize(message)
          @message = message
        end

        def call
          if url = search
            message.reply(url)
          end
        end

        def search
          if media = response[0]
            media.images.low_resolution.url
          end
        end

        def response
          instagram.tag_recent_media(URI.encode(message[:keyword]), :count => 1)
        end

        def instagram
          ::Instagram.configure do |config|
            config.client_id     = ENV["INSTAGRAM_CLIENT_ID"]
            config.client_secret = ENV["INSTAGRAM_CLIENT_SECRET"]
          end

          ::Instagram.client
        end
      end
    end
  end
end
