require 'spec_helper'
describe "Static 1s", :type => :request do
	describe "Home" do
		it "should have the content 'Sample App'" do
			visit '/static1s/home'
			page.should have_content('Sample App')
		end
	end
end