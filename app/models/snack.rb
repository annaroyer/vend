class Snack < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :snack_machines
  has_many :machines
end
