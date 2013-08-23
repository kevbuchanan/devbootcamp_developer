require 'spec_helper'

describe "contact page" do
  context "contact email form" do
    before do
      visit "/contact"
    end

    it "The form loads correctly" do
      visit '/contact'
      expect(page).to have_content('Contact us')
    end

    it "clicking Send redirects you to documentation" do
      click_button("Send")
      current_path.should eq "/documentation"
    end

    it "should send a contact email" do
      Pony.stub(:mail).and_return(true)
      expect(Pony).to receive(:mail)
      click_button("Send")
    end
  end
end
