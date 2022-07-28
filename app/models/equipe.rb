class Equipe < ApplicationRecord
  validates_length_of :nom, within: 1..50, too_long: 'Beware on the size of characters 50max.', too_short: 'Beware on the size of characters.'
  validates :nom, presence: true
  validates :ville, presence: true

  has_many :joueur
end
