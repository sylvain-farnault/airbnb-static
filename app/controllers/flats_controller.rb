require 'open-uri'

class FlatsController < ApplicationController
  def index
    @flats = get_flats
  end

  def show
    # flats don't need to be an intance variable
    # ==> we don't need to pass those datas to the view
    flats = get_flats
    # params[:id]
    @flat = flats.find { |flat|
      flat["id"] == params[:id].to_i
    }
  end

  private

  def get_flats
    url = 'https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json'
    JSON.parse(open(url).read)
  end
end
