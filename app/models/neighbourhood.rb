# frozen_string_literal: true

class Neighbourhood < ApplicationRecord
  has_many :service_requests
  validates :name, :number_of_hospital, presence: true
end
