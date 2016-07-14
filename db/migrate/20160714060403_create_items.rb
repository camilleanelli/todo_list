class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :todolist, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
