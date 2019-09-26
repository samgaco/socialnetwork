# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user_id { 1 }
    post_id { 1}
    text { 'Do I Need more than this??' }
  end
end
