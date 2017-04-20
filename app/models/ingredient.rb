class Ingredient < ApplicationRecord
  before_destroy { self.doses }
  has_many :doses

  validates :name, presence: true, uniqueness: true
end
