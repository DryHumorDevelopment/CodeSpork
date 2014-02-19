class CreateChangelogs < ActiveRecord::Migration
  def change
    create_table :changelogs do |t|
      t.string :user
      t.text :content
      t.datetime :date

      t.timestamps
    end
  end
end
