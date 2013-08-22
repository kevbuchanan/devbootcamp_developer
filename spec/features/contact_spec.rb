require 'spec_helper'

describe "IntegrationHelper" do
  context "contact email form" do
    before do
      visit "/contact"
    end

    it "The form loads correctly when not logged in" do
      page.should have_content("SEND")
    end

    it "clicking SEND redirects you to documentation" do
      click_button "SEND"
      current_path.should eq "/documentation"
    end
  end

  it "should send a contact email" do
    do_not_send_email
    Pony.should_receive(:deliver) do |mail|
        mail.to.should == [ 'development@devbootcamp.com' ]
    end
  end
end
