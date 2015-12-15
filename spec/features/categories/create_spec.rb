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

    it "displays an error when the category has no title" do
        expect(Category.count).to eq(0)

        visit "/"
        click_link "New Category"
        expect(page).to have_content("New Category")

        fill_in "Title", with: ""
        fill_in "Description", with: "Empty"
        click_button "Create Category"

        expect(page).to have_content("error")
        expect(Category.count).to eq(0)

        visit "/"
        expect(page).to_not have_content("Empty")
    end

    it "displays an error when the category has title less than 3 characters" do
        expect(Category.count).to eq(0)

        visit "/"
        click_link "New Category"
        expect(page).to have_content("New Category")

        fill_in "Title", with: ""
        fill_in "Description", with: "Empty"
        click_button "Create Category"

        expect(page).to have_content("error")
        expect(Category.count).to eq(0)

        visit "/"
        expect(page).to_not have_content("Empty")
    end

    it "displays an error when the category has no description" do
        expect(Category.count).to eq(0)

        visit "/"
        click_link "New Category"
        expect(page).to have_content("New Category")

        fill_in "Title", with: "MyTitle"
        fill_in "Description", with: ""
        click_button "Create Category"

        expect(page).to have_content("error")
        expect(Category.count).to eq(0)

        visit "/"
        expect(page).to_not have_content("MyTitle")
    end

    it "displays an error when the category has description less than 5 characters" do
        expect(Category.count).to eq(0)

        visit "/"
        click_link "New Category"
        expect(page).to have_content("New Category")

        fill_in "Title", with: "MyTitle"
        fill_in "Description", with: "MyDe"
        click_button "Create Category"

        expect(page).to have_content("error")
        expect(Category.count).to eq(0)

        visit "/"
        expect(page).to_not have_content("Empty")
    end
end
