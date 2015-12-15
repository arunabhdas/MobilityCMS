require 'spec_helper'

describe "Creating categories" do
    it "redirects to the categories index page on success" do
        visit "/"
        click_link "New Category"
        expect(page).to have_content("New Category")

        fill_in "Title", with: "TestCategoryTitle"
        fill_in "Description", with: "TestDescriptionTitle"
        click_button "Create Category"
        expect(page).to have_content("TestCategoryTitle")


    end
end
