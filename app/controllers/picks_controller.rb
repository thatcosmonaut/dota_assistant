class PicksController < ApplicationController
  respond_to :html

  def hero_picker
    @heroes = Hero.all
  end
  
  def recommendation
    @friendlies = []
    params[:friendlies].try(:each) do |id|
      @friendlies << Hero.find(id)
    end

    @enemies = []
    params[:enemies].try(:each) do |id|
      @enemies << Hero.find(id)
    end

    result = Recommendations.best_pick @friendlies, @enemies
    @recommendation = result.first
    @worst = result.last
  end
end
