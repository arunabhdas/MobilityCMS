require 'spec_helper'

describe "Creating categories" do

    it "updates a category successfully with correct information" do
        category = Category.create(title: "Science", description: "Science is great for scientists")
        visit "/categories"
        

    end

end
