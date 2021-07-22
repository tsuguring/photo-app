class CreateCoordinations < ActiveRecord::Migration[6.1]
  def change
    create_table :coordinations do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :image_id

      t.timestamps
    end
  end
end
