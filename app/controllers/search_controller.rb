class SearchController < ApplicationController
  def index
    @stations = NrelService.new.get_by_zipcode(params[:q])
  end
end
