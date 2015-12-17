class StoryStream < ActiveRecord::Base
  belongs_to :category
  validates :content, presence: true,
                      length: {minimum: 2}
end
