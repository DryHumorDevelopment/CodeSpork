class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :username
      t.string :avatar
      t.string :title
      t.text :description
      t.text :code

      t.timestamps
    end
  end
end
