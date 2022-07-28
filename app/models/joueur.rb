class Joueur < ApplicationRecord
  validates :nom, presence: true
  validates :poste, presence: true

 # belongs_to :equipe

end
