class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.integer :kind, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
