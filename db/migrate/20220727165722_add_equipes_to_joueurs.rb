class AddEquipesToJoueurs < ActiveRecord::Migration[7.0]
  def change
    add_reference :joueurs, :equipes, null: false, foreign_key: true
  end
end
