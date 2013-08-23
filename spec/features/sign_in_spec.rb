require 'spec_helper'
require 'rspec'

describe 'sign in' do
  context 'not signed in' do
    it 'shows a sign in link' do
      visit '/'
      expect(page).to have_content('Sign in')
    end

    it 'should redirect to dbc auth' do
      visit '/'
      click_link('Sign in')
      expect(URI.parse(current_url).host).to eql('auth.devbootcamp.com')
    end
  end
end
