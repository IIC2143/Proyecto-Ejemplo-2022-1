# frozen_string_literal: true

require 'faker'

# Una factory nos permitirá crear de manera sencilla instancias de una clase con diferentes valores
# y sin la necesidad de que nosotros le asignemos los parámetros al momento de crearla.
FactoryBot.define do
  factory :publication do
    title { Faker::Lorem.words(number: rand(10..20)) }
    content { Faker::Lorem.paragraph }
  end
end
