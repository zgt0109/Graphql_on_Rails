class AddUserIdToLink < ActiveRecord::Migration[5.1]
  def change
    add_reference :links, :user, foreign_key: true
  end
end
