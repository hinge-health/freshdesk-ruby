require 'faraday'
require 'json'

module Freshdesk
  class Resource
    def initialize(endpoint, params = {}, id = nil)
      @endpoint             = endpoint
      @params               = params
      @id                   = id
      @domain               = Freshdesk.domain
      @user_name_or_api_key = Freshdesk.user_name_or_api_key
      @password_or_x        = Freshdesk.password_or_x
      @api_version          = Freshdesk.api_version
    end

    attr_reader :endpoint, :params

    def api_url
      "https://#{@domain}.freshdesk.com/api/#{@api_version}#{@endpoint}"
    end

    def json_payload
      @params.to_json
    end

    def post
      ::Faraday.post(api_url, json_payload, headers).then do |response|
        return JSON.parse(response.body) if response.success?

      rescue StandardError
        raise ::Faraday::BadRequestError, api_error_message(response)
      end
    end

    def get
      ::Faraday.get(api_url, params, headers).then do |response|
        return JSON.parse(response.body) if response.success?

      rescue StandardError
        raise ::Faraday::BadRequestError, api_error_message(response)
      end
    end

    def put
      ::Faraday.put(api_url, json_payload, headers).then do |response|
        return JSON.parse(response.body) if response.success?

      rescue StandardError
        raise ::Faraday::BadRequestError, api_error_message(response)
      end
    end

    def delete
      ::Faraday.delete(api_url, headers).then do |response|
        return JSON.parse(response.body) if response.success?

      rescue StandardError
        raise ::Faraday::BadRequestError, api_error_message(response)
      end
    end

    private

    def api_error_message(response)
      "API Error: Your request is not successful." \
      "If you are not able to debug this error properly, mail us at support@freshdesk.com with the follwing X-Request-Id" \
      "X-Request-Id : #{response.headers[:x_request_id]}" \
      "Response Code: #{response.status} Response Body: #{response.body}"
    end

    def headers
      {
        'Content-Type': 'application/json',
        Accept: 'application/json',
        Authorization: "Basic #{auth_header}"
      }
    end

    def auth_header
      Base64.strict_encode64("#{@user_name_or_api_key}:#{@password_or_x}")
    end
  end
end
