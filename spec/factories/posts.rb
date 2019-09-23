FactoryBot.define do
  factory :post do
    tile { "MyString" }
    content { "MyText" }
    user { nil }
  end
end
