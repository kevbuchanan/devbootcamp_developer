require 'spec_helper'

describe "On contact page", :type => :feature do
    before do
      visit "/contact"
    end

    it "the form loads correctly" do
      expect(page).to have_content('Contact us')
    end

    it "should send a contact email" do
      Pony.stub(:mail).and_return(true)
      expect(Pony).to receive(:mail)
      click_button("Send")
    end

    it "clicking Send redirects you to documentation" do
      click_on('Send')
      current_path.should eq "/documentation"
    end
end
