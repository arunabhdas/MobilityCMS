require 'spec_helper'

describe "Creating categories" do
    it "redirects to the categories index page on success" do
        visit "/"
        click_link "New Category"
        expect(page).to have_content("New Category")
    end
end
