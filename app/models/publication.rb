# frozen_string_literal: true

class Publication < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, length: { minimum: 5 }
  validates :content, length: { minimum: 10 }
end
