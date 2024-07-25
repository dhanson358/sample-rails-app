# spec/factories/patients.rb
FactoryBot.define do
 factory :patient do
   name { "John Doe" }
   contact_info { "123 Main St" }
 end
end
