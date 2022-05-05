FactoryBot.define do
  factory :comment do
    content { "MyString" }
    user { nil }
    publication { nil }
  end
end
