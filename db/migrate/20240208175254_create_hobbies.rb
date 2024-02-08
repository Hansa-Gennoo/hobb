class CreateHobbies < ActiveRecord::Migration[7.1]
  def change
    create_table :hobbies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
