require 'spec_helper'

describe "Viewing todo items" do
    let!(:category) {Category.create(title: "Gadgets", description: "Gadgets News")}
    #---------------------------------------------------------------------------
    def visit_category(category)
        visit "/categories"
        within "#category_#{category.id}" do
            click_link "List StoryStreams"
        end
    end
    #---------------------------------------------------------------------------
    it "is successful with valid content" do
        visit_category(category)
        click_link "New StoryStream"
        fill_in "Content", with: "Interest Rate Hike"
        click_button "Save"
        expect(page).to have_content("Added story_stream")
        within("ul.story_streams") do
            expect(page).to have_content("Interest Rate Hike")
        end
    end
    #---------------------------------------------------------------------------
    it "displays an error with no content" do
        visit_category(category)
        click_link "New StoryStream"
        fill_in "Content", with: ""
        click_button "Save"
        within("div.flasherror") do
            expect(page).to have_content("There was a problem adding that story stream")
        end
    end
    #---------------------------------------------------------------------------
    #TODO FIXME Why is this failing
    it "displays an error with content less than 2 characters" do
        visit_category(category)
        click_link "New StoryStream"
        fill_in "Content", with: "1"
        click_button "Save"
        within("div.flasherror") do
            expect(page).to have_content("There was a problem adding that story stream")
        end
        expect(page).to have_content("Content is too short")
    end
    #---------------------------------------------------------------------------
end
