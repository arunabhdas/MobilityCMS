require 'spec_helper'

describe "Editing categories" do
    category = Category.create(title: "Science", description: "Science is great for scientists")
    it "updates a category successfully with correct information" do
        visit "/categories"
        within "#category_#{category.id}" do
            click_link "Edit"
        end

        fill_in "Title", with: "My Title"
        fill_in "Description", with: "My Description"
        click_button "Update Category"

        category.reload

        expect(page).to have_content("Category was successfully updated")
        expect(category.title).to eq("My Title")
        expect(category.description).to eq("My Description")
    end

end
