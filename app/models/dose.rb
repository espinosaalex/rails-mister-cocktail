class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :ingredient, uniqueness: { scope: :cocktail,
    message: "should be a unique pair" }
end
