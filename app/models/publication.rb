# frozen_string_literal: true

class Publication < ApplicationRecord
  validates :title, length: { minimum: 5 }
  validates :content, length: { minimum: 10 }
end
