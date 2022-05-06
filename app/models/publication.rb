# frozen_string_literal: true

class Publication < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
end
