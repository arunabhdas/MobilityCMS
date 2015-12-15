require 'spec_helper'

describe "Creating categories" do
    #---------------------------------------------------------------------------
    def create_category(options={})
        options[:title] ||= "My Cateogry Title"
        options[:description] ||= "My Category Description"

        visit "/"
        click_link "New Category"
        expect(page).to have_content("New Category")

        fill_in "Title", with: options[:title]
        fill_in "Description", with: options[:description]
        click_button "Create Category"
    end
    #---------------------------------------------------------------------------
    it "redirects to the categories index page on success" do
        create_category
        expect(page).to have_content("Title")
    end
    #---------------------------------------------------------------------------
    it "displays an error when the category has no title" do
        # expect(Category.count).to eq(0)
        create_category title: ""
        expect(page).to have_content("error")
        # expect(Category.count).to eq(0)
        visit "/"
        expect(page).to_not have_content("MyDescription")
    end

    #---------------------------------------------------------------------------
    it "displays an error when the category has title less than 3 characters" do
        # expect(Category.count).to eq(0)

        create_category title: "My"
        expect(page).to have_content("error")
        # expect(Category.count).to eq(0)

        visit "/"
        expect(page).to_not have_content("Empty")
    end
    #---------------------------------------------------------------------------
    it "displays an error when the category has no description" do
        # expect(Category.count).to eq(0)
        create_category title: "Science", description: ""

        expect(page).to have_content("error")
        # expect(Category.count).to eq(0)

        visit "/"
        expect(page).to_not have_content("MyTitle")
    end
    #---------------------------------------------------------------------------
    it "displays an error when the category has description less than 5 characters" do
        # expect(Category.count).to eq(0)

        create_category title: "Science", description: "MyDe"

        expect(page).to have_content("error")
        # expect(Category.count).to eq(0)

        visit "/"
        expect(page).to_not have_content("Empty")
    end
end
