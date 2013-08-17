require 'spec_helper'

describe "/sign_in" do
	it "redirects to dbc auth" do
		visit "/sign_in"
		current_path.should == "/oauth/authorize"
	end
end

# describe "/auth" do
# 	it "does stuff" do
# 		visit "/sign_in"
# 		# within(".string email required") do
# 			fill_in "Email", :with => "tanner@devbootcamp.com"
# 			fill_in "Password", :with => "pizza"
# 		# end
# 		click_button('Authenticate')
# 		save_and_open_page
# 		expect(page).to have_content "Hello"
# 	end
# end

# describe "/sign_out" do
# 	it "clears the session and redirects to the index" do
# 		session = mock(:session)
# 		session.stub(:[]).with(:user_id).and_return(1)
# 		visit "/sign_out"
# 		expect ( session[:user_id] = nil)
# 		current_path.should == "/"
# 	end
end
