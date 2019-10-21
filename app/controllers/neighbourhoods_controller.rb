# frozen_string_literal: true

class NeighbourhoodsController < ApplicationController
  def index; end

  def show
    @neighbourhood = Neighbourhood.find(params[:id])
  end
end
