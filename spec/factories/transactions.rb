FactoryBot.define do
 factory :transaction do
   patient
   charge { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
   credit { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
   date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
 end
end