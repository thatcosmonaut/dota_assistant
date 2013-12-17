class PicksController < ApplicationController
  respond_to :html

  def hero_picker
    @heroes = Hero.all
  end

  def recommendation
    @friendlies = params[:friendlies].try(:map) { |id| Hero.find(id) } || []
    @enemies = params[:enemies].try(:map) { |id| Hero.find(id) } || []

    result = Recommendations.pick_recommendations @friendlies, @enemies
    @recommendation = result.first
    @worst = result.last
  end
end
