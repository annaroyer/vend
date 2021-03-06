class Snack < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

  def formatted_price
    '%.2f' % price.to_f.round(2)
  end

  def locations
    machines.pluck(:location)
  end
end
