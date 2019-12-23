class Rates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.float :value
      t.belongs_to :movie
      t.belongs_to :user
    end
  end
end
