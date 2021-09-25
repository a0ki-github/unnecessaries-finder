class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.integer :kind, default: 0, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
