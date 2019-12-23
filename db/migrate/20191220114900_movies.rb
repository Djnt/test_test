class Movies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :text
      t.belongs_to :category
    end
  end
end
