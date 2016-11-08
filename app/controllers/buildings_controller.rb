class BuildingsController < ApplicationController
  def index
    @buildings = Building.all.limit(100)
  end
end
