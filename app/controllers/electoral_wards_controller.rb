# frozen_string_literal: true

class ElectoralWardsController < ApplicationController
  def index; end

  def show
    @ward = ElectoralWard.find(params[:id])
  end
end
