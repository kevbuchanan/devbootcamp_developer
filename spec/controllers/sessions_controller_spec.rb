require 'spec_helper'
require 'uri'

describe "/sign_in" do
	before do
		get "/sign_in"
		@uri = URI(last_response.location)
	end

	it "redirects to dbc auth" do
		last_response.should be_redirect
		@uri.path.should eq "/oauth/authorize"
	end

	context "checking querystring arguments" do
		before do
			@args  = Rack::Utils.parse_query @uri.query
		end

		it "should request an authorization code" do
			@args["response_type"].should eq "code"
		end

		it "wants the user sent back to the /auth endpoint" do
			redirect_uri = URI(@args["redirect_uri"])
			redirect_uri.path.should eq "/auth"
		end
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
