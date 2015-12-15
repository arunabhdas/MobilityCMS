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
    before do
    end
    #---------------------------------------------------------------------------
    it "displays no story_streams when a category is empty" do
        # expect(page).to have_content("StoryStreams#index")
        visit_category(category)
        expect(page.all("ul.story_streams li").size).to eq(0)
    end
    #---------------------------------------------------------------------------
    it "displays the title of the StoryStream" do
        visit_category(category)
        within("h1") do
            expect(page).to have_content(category.title)
        end

    end
    #---------------------------------------------------------------------------
    it "displays story_stream content when a category has story_streams" do
        category.story_streams.create(content: "Climate Change")
        category.story_streams.create(content: "Global Warming")
        visit_category(category)
        expect(page.all("ul.story_streams li").size).to eq(2)
        within "ul.story_streams" do
            expect(page).to have_content("Climate Change")
            expect(page).to have_content("Global Warming")
        end
    end
    #---------------------------------------------------------------------------
end
