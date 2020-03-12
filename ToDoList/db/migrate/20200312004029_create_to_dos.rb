class CreateToDos < ActiveRecord::Migration[6.0]
  def change
    create_table :to_dos do |t|
      t.string :userID
      t.string :toDoItem
      t.string :complete

      t.timestamps
    end
    add_index :to_dos, :userID, unique: true
  end
end
