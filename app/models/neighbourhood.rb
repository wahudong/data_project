# frozen_string_literal: true

class Neighbourhood < ApplicationRecord
  has_many :service_requests
end
