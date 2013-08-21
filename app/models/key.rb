require 'net/http'
require 'uri'
require 'json'

class ApiKey
  attr_reader :key, :created_at

  def initialize(attributes)
    @user_id = attributes['user_id']
    @key = attributes['key']
    @created_at = Time.parse(attributes['created_at'])
  end

  def self.request(user_id)
    uri = URI.parse(API_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    request.add_field('Authorization', API_AUTH_HEADER_LABEL + ' ' + ENV['DBC_SHARED'])
    response = http.request(request)
    attributes = JSON.parse(response.body)
    ApiKey.new(attributes['api_key'])
  end
end
