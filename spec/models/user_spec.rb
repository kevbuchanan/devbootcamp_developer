require 'spec_helper'

describe User do

	context "when name is given" do
    attributes = Hash["name", "Abraham"]
		let (:user) { User.new(attributes) }
		it "should return the name" do
			expect(user.name).to eq "Abraham"
		end
	end
end

