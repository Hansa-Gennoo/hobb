class AddReferenceToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_reference :chatrooms, :hobby, foreign_key: true
  end
end
