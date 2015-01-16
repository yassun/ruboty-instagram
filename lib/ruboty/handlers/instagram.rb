require "ruboty/instagram/actions/instagram"

module Ruboty
  module Handlers
    class Instagram < Base
      on /instagram instagram/, name: 'instagram', description: 'TODO: write your description'

      def instagram(message)
        Ruboty::Instagram::Actions::Instagram.new(message).call
      end
    end
  end
end
