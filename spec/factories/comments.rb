FactoryBot.define do
  factory :comment do
    new { "MyString" }
    user { nil }
    post { nil }
  end
end
