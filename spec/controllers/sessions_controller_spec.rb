require 'spec_helper'
require 'uri'

describe "sign_in" do
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
			@args  = Rack::Utils.parse_query(@uri.query)
		end

		it "should request an authorization code" do
			@args["response_type"].should eq "code"
		end

		it "should include the correct redirect_uri" do
			redirect_uri = URI(@args["redirect_uri"])
			redirect_uri.path.should eq "/auth"
		end

		it "should include the client id" do
			@args["client_id"].should_not be_nil
		end
	end
end

describe "sign_out" do

	before do
		get "/sign_out"
	end

	it "redirects to the index" do
		last_response.should be_redirect
	end
end


