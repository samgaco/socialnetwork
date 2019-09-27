# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    new { 'MyString' }
    user { nil }
    post { nil }
  end
end
