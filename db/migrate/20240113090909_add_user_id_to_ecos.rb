class AddUserIdToEcos < ActiveRecord::Migration[6.1]
  def change
    add_column :ecos, :user_id, :integer
  end
end
