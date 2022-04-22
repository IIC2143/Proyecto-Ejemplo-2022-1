# frozen_string_literal: true

require 'faker'

# Una factory nos permitirá crear de manera sencilla instancias de una clase con diferentes valores
# y sin la necesidad de que nosotros le asignemos los parámetros al momento de crearla.
FactoryBot.define do
  factory :profile do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    email { Faker::Internet.email }
    work { Faker::Job.title }
    age { 21 }
  end
end
