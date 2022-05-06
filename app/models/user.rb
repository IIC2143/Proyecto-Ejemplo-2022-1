# frozen_string_literal: true

class User < ApplicationRecord
  has_many :publications, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :offers
  has_many :offerers, :through => :offers, :class_name => "User"
  has_many :aplicants, :through => :offers, :class_name => "User"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :name, length: { minimum: 2 }
  # validates :description, length: { minimum: 5 }
  validates :age, numericality: { greater_than_or_equal_to: 0 }

  def summary
    # "#{name} - #{age} - #{work}"
  end
end
