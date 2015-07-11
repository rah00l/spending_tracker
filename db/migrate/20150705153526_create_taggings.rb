class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings, :force => true do |t|
      t.integer :taggable_id
      t.string :taggable_type
      t.integer :tag_id

      t.timestamps null: false
    end
    add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  end
end
