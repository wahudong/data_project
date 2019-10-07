# frozen_string_literal: true

class ElectoralWard < ApplicationRecord
  has_many :service_requests
end
