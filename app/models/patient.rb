class Patient < ApplicationRecord
  has_many :transactions

  validates_presence_of :first_name, :last_name, :age, :gender
  validates_uniqueness_of :email, :phone_number

  enum gender: { "Male" => 0, "Female" => 1 }
end
