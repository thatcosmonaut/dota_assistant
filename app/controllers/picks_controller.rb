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

    @recommendation = Recommendations.best_pick @friendlies, @enemies
  end
end
