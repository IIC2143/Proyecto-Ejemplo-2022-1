# frozen_string_literal: true

class Profile < ApplicationRecord
  validates :name, length: { minimum: 2 }
  validates :description, length: { minimum: 5 }
  validates :email, presence: true, uniqueness: true
  validates :age, numericality: { greater_than_or_equal_to: 0 }

  def summary
    "#{name} - #{age} - #{work}"
  end
end
