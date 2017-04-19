class Loan < ApplicationRecord
  attr_accessor :retrait

  belongs_to :user
  monetize :capital_cents
end
