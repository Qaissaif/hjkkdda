class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.text :icon
      t.text :color

      t.timestamps
    end
  end
end
