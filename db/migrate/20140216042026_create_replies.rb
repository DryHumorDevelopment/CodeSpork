class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :answer
      t.integer :user_id
      t.references :forum, index: true

      t.timestamps
    end
  end
end
