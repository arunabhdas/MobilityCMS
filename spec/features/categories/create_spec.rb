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

    it "displays an error when the todo list has no title" do
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

    it "displays an error when the todo list has title less than 3 characters" do
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

    it "displays an error when the todo list has no description" do
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
end
