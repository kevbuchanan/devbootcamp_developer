require 'spec_helper'

describe User do

  let (:user) { User.new( 'name' => 'Steve', 'id' => 1, 'email' => 'steve@steve.com', 'gravatar' => 'gravatar_url')}

  it 'has an id' do
    expect(user.id).to eq(1)
  end

  it 'has an name' do
    expect(user.name).to eq('Steve')
  end

  it 'has an email' do
    expect(user.email).to eq('steve@steve.com')
  end

  it 'has an gravatar' do
    expect(user.gravatar).to eq('gravatar_url')
  end
end

