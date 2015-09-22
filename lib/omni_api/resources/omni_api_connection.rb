require 'active_resource/connection'

module OmniApi
  module Resources
    class OmniApiConnection < ActiveResource::Connection
      def initialize(site, format = ActiveResource::Formats::JsonFormat)
        super
      end

      attr_writer :error_handler

      def request(*arguments)
        super
      rescue => e
        @error_handler.present? ? @error_handler.handle(e, self, arguments) : raise
      end
    end
  end
end