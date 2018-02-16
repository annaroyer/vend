class Snack < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

  def formatted_price
    '%.2f' % price
  end
end
