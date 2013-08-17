require 'net/http'
require 'uri'
require 'json'

module Api
  module ApiKey

    def self.request(user_id)
      # url = URI.parse("http://localhost:3000/v1/api_keys/#{user_id}")
      # request = Net::HTTP::Get.new(url.path)
      # request.add_field("Authentication", "xxxxxx")
      response = Net::HTTP.get_response(URI("http://localhost:3000/v1/api_keys/#{user_id}"))
      JSON.parse(response.body)
    end

  end
end