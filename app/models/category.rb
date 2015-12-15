class Category < ActiveRecord::Base
    has_many :story_streams
    validates :title, presence: true
    validates :title, length: {minimum: 3}
    validates :description, presence: true
    validates :description, length: {minimum: 5}
end
