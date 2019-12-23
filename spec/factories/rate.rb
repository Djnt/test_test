FactoryBot.define do
  factory :rate do
    user { nil }
    movie { nil }
    value { rand(0..10) }
  end
end
