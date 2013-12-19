class PicksController < ApplicationController
  COMPOSITION = {
    'ideal_balanced_vector' => '2-1-2',
    'ideal_jungling_vector' => 'Jungling',
    'ideal_trilane_vector' => 'Trilane'
  }

  respond_to :html

  def hero_picker
    @heroes = Hero.all
  end

  def recommendation
    @friendlies = params[:friendlies].try(:map) { |id| Hero.find(id) } || []
    @enemies = params[:enemies].try(:map) { |id| Hero.find(id) } || []

    result = Recommendations.pick_recommendations @friendlies, @enemies, params[:composition].upcase
    @recommendation = result.first
    @worst = result.last

    @composition = COMPOSITION[params[:composition]]
  end
end
