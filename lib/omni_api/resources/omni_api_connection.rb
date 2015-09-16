module OmniApi
  module Resources
    class OmniApiConnection < ActiveResource::Connection
      def initialize(site, format = ActiveResource::Formats::JsonFormat)
        super
      end

      attr_accessor :error_handler

      private

      def request(method, path, *arguments)
        super
      rescue Error => e
        error_handler.present? ? error_handler.handle(e) : raise
      end
    end
  end
end