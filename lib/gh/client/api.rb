module Gh
  class Client
    class API < Driver::API
      drive Issue, Milestone

      def initialize(user, password, proxy: nil,
                                     debug: false,
                                     endpoint: 'https://api.github.com',
                                     enterprise: false)
        require "faraday"
        require "json"

        @user = user
        @password = password
        @endpoint = endpoint
        @enterprise = enterprise

        @conn = Faraday.new do |faraday|
          faraday.proxy proxy if proxy
          faraday.response :logger, nil, bodies: true if debug
          faraday.use Faraday::Request::BasicAuthentication, @user, @password
          faraday.adapter Faraday.default_adapter
        end
      end

      attr_reader :user

      def request(method, resource, payload = nil, headers = nil)
        resource = File.join("api/v3", resource) if @enterprise
        url = File.join @endpoint, resource

        response = case method
        when :get
          @conn.get(url, headers)
        when :post
          @conn.post(url, payload, headers)
        end

        if response.present?
          data = JSON.load(response.body) rescue []
          data.freeze
        end

        status = response.status
        raise "Invalid Status\tcode: #{status}, body: #{data}" if status > 400

        data
      end
    end
  end
end
