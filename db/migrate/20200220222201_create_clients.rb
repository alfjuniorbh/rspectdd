class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :smoker
      t.string :phone
      t.string :avatar

      t.timestamps
    end
  end
end
