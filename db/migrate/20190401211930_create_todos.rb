class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :content
      t.boolean :done, default: false
      t.integer :user_id
    end
  end
end
