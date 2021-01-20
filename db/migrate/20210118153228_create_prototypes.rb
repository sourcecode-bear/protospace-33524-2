class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title,              null: false
      t.string :catch_copy,         null: false
      t.string :concept,            null: false
      t.timestamps
      t.references :user,           foreign_key: true
    end
  end
end
