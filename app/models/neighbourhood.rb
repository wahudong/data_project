class Neighbourhood < ApplicationRecord
  validates :name, :number_of_hospital, presence: true

  has_many :service_requests
end
