class CreatePoemReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :poem_reviews do |t|
      t.float :grade
      t.text :comment
      t.references :user, foreign_key: true
      t.references :poem, foreign_key: true
    end
  end
end
