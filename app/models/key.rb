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
    uri = URI.parse("http://localhost:3000/v1/api_keys/#{user_id}")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    request.add_field('Authorization', 'DBC-TOKEN test')
    response = http.request(request)
    attributes = JSON.parse(response.body)
    ApiKey.new(attributes)
  end
end