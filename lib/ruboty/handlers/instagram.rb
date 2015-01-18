require "ruboty/instagram/actions/instagram"

module Ruboty
  module Handlers
    class Instagram < Base
      on /instagram (?<keyword>.+)/, name: 'instagram', description: 'Search image from instagram'

      def instagram(message)
        Ruboty::Instagram::Actions::Instagram.new(message).call
      end
    end
  end
end
