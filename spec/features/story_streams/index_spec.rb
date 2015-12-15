require 'spec_helper'

describe "Viewing todo items" do
    let!(:category) {Category.create(title: "Gadgets", description: "Gadgets News")}
    it "displays no story_streams when a category is empty" do
        visit "/categories"
        within "#category_#{category.id}" do
            click_link "List StoryStreams"
        end
        expect(page).to have_content("StoryStreams#index")
    end
end
