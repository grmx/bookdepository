class CreditCard < ActiveRecord::Base
  belongs_to :user
  has_many :orders, dependent: :destroy

  validates :number, :exp_month, :exp_year, :firstname, :lastname, presence: true
  validates :number, length: { is: 16 }
  validates :exp_month, :exp_year, length: { is: 2 }
end
