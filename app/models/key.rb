require 'net/http'
require 'uri'
require 'json'

class ApiKey
  attr_reader :key

  def initialize(attributes)
    @user_id = attributes['id']
    @key = attributes['key']
  end

  def self.request(user_id)
    # url = URI.parse("http://localhost:3000/v1/api_keys/#{user_id}")
    # request = Net::HTTP::Get.new(url.path)
    # request.add_field("Authentication", "xxxxxx")
    response = Net::HTTP.get_response(URI("http://localhost:3000/v1/api_keys/#{user_id}"))
    attributes = JSON.parse(response.body)
    ApiKey.new(attributes)
  end
end