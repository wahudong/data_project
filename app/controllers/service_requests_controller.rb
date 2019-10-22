# frozen_string_literal: true

class ServiceRequestsController < ApplicationController
  def index
    @requests = ServiceRequest.all.page(params[:page])
  end

  def show
    @request = ServiceRequest.find(params[:id])
  end

  def search_results
    @requests = ServiceRequest.where('service_request LIKE ?', "%#{params[:keywords]}%")

    # render :index if @requests
  end

  # def search_results
  # Here we will be using the Product model to actually search.
  #   @products = Product.where('name LIKE ?', "%#{params[:keywords]}%")
  # end
end
