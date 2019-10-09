# frozen_string_literal: true

class ServiceRequestsController < ApplicationController
  def index
    @requests = ServiceRequest.all
  end

  def show; end
end
