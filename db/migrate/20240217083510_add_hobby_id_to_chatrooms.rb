class AddHobbyIdToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_reference :chatrooms, :hobby, null: false, foreign_key: true
  end
end
