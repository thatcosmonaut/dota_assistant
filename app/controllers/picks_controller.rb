class PicksController < ApplicationController
  COMPOSITION = {
    'ideal_balanced_vector' => '2-1-2',
    'ideal_jungling_vector' => 'Jungling',
    'ideal_trilane_vector' => 'Trilane'
  }

  respond_to :html

  def hero_picker
    @heroes = Hero.all

    @hero_autocomplete_array = [].tap do |list|
      Hero.scoped.each do |hero|
        list << { label: hero.name, value: hero.id }
      end
    end
  end

  def recommendation
    @friendlies = params[:friendlies].reject!{ |elt| elt == ""}.try(:map) { |id| Hero.find(id) } || []
    @enemies = params[:enemies].reject!{ |elt| elt == ""}.try(:map) { |id| Hero.find(id) } || []

    result = Recommendations.pick_recommendations @friendlies, @enemies, params[:composition].upcase
    @recommendation = result.first
    @worst = result.last

    @composition = COMPOSITION[params[:composition]]
  end
end
