class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :role, null: false, default: 'user'
      t.string :photo, null: false, default: 'https://www.kindpng.com/picc/m/22-223965_no-profile-picture-icon-circle-member-icon-png.png'

      t.timestamps
    end
  end
end
