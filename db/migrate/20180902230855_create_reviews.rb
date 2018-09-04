class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :author
      t.text :body
      t.float :rating
      t.belongs_to :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
