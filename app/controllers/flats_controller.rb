require 'open-uri'

class FlatsController < ApplicationController
  def index
    @flats = get_flats
  end

  def show
    @flats = get_flats
    # params[:id]
    @flat = @flats.select { |flat|
      flat["id"] == params[:id].to_i
    }.first
  end

  private

  def get_flats
    url = 'https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json'
    JSON.parse(open(url).read)
  end
end
