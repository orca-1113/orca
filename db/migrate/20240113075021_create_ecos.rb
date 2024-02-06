class CreateEcos < ActiveRecord::Migration[6.1]
  def change
    create_table :ecos do |t|
      t.text :about

      t.timestamps
    end
  end
end
