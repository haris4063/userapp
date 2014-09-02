require 'spec_helper'
require 'minitest/autorun'
describe "StaticPages" do
  describe "GET /static_pages" do
    it "works! (now write some real specs)" do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end
  end
end
