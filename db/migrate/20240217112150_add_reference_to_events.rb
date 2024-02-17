class AddReferenceToEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :hobby, null: false, foreign_key: true
  end
end
