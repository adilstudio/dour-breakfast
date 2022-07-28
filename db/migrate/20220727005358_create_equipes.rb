class CreateEquipes < ActiveRecord::Migration[7.0]
  def change
    create_table :equipes do |t|
      t.string :nom, limit: 50
      t.string :ville

      t.timestamps
    end
  end
end
