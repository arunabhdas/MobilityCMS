class CreateStoryStreams < ActiveRecord::Migration
  def change
    create_table :story_streams do |t|
      t.references :category, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
