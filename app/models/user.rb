class User
  attr_reader :id, :name, :email, :gravatar

  def initialize(attributes)
    @id = attributes['id']
    @name = attributes['name']
    @email = attributes['email']
    @gravatar = attributes['gravatar']
  end

  def api_key
    @api_key ||= ApiKey.request(self.id)
  end
end