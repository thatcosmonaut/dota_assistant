class PicksController < ApplicationController
  respond_to :html

  def hero_picker
    @heroes = Hero.all
  end
  
  def recommendation
    @list_of_heroes = []
    params[:heroes].each do |id|
      @list_of_heroes << Hero.find(id)
    end
    @recommendation = Recommendations.best_pick @list_of_heroes
  end
end
