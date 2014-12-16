class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :category
      t.integer :priority, default: 1
      t.boolean :is_completed, default: false

      t.timestamps
    end
  end
end
