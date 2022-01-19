class DropFeedbacks < ActiveRecord::Migration[6.1]
  def change
    drop_table :feedbacks do |t|
      t.string "uuid"
      t.integer "kind", null: false
      t.text "content", null: false

      t.timestamps
    end
  end
end
