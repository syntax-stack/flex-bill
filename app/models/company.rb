class Company < ApplicationRecord
  has_one :subscription, dependent: :destroy
  has_many :usage_records, dependent: :destroy
  has_many :invoices, dependent: :destroy

  validates :name, presence: true
end
