FactoryBot.define do
  factory :friendship do

    title{ "types of friendships"}
 
    trait :accepted do
      status {true}
    end
   
    trait :pending do
      status {false}
    end

    trait :nil do
      status {nil}
    end
     
    factory :accepted_request,  traits: [:accepted]
    factory :pending_request,  traits: [:pending]
    factory :nil_request,  traits: [:nil]


  end
end
