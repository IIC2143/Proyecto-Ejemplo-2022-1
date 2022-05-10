# frozen_string_literal: true

class Offer < ApplicationRecord
  belongs_to :offerer, class_name: 'User', optional: true
  belongs_to :aplicant, class_name: 'User', optional: true
end
