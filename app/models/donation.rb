class Donation < ApplicationRecord
  validates :amount, presence: true
  validates :name, presence: true 
  validates :email, presence: true

  pay_customer

end
