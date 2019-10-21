# frozen_string_literal: true

class ServiceRequestsController < ApplicationController
  def index
    @requests = ServiceRequest.all.page(params[:page])
  end

  def show
    @request = ServiceRequest.find(params[:id])
  end
end
