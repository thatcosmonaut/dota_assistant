class PicksController < ApplicationController
  COMPOSITION = {
    'ideal_balanced_vector' => '2-1-2',
    'ideal_jungling_vector' => 'Jungling',
    'ideal_trilane_vector' => 'Trilane'
  }

  respond_to :html, :js

  def hero_picker
    @heroes = Hero.all
  end

  def recommendation
    @friendlies = Build.where(id: params[:friendlies])
    @enemies = Hero.where(id: params[:enemies])
    @bans = Hero.where(id: params[:bans])

    @recommendation, @worst = Recommendations.pick_recommendations @friendlies, @enemies, @bans, params[:composition].upcase if @friendlies.count > 0

    # if (@friendlies + @enemies).length > 3
    #   @ban_recommendations = (Recommendations.pick_recommendations @enemies, @friendlies, @bans, 'IDEAL_BALANCED_VECTOR').first
    # end

    @composition = COMPOSITION[params[:composition]]

    @needed_roles = Recommendations.roles_needed @friendlies, params[:composition].upcase unless @friendlies.empty?
    @filled_roles = Recommendations.roles_filled @friendlies, params[:composition].upcase unless @friendlies.empty?

    respond_to do |format|
      format.json
    end
  end

  def remaining_builds
    params[:friendlies] ||= []
    params[:enemies] ||= []
    params[:bans] ||= []

    @remaining = Build.where.not(hero_id: params[:friendlies] + params[:enemies] + params[:bans])
    respond_to do |format|
      format.json
    end
  end

  def remaining_heroes
    params[:friendlies] ||= []
    params[:enemies] ||= []
    params[:bans] ||= []

    friendly_hero_ids = Build.where(id: params[:friendlies]).pluck(:hero_id)

    @remaining = Hero.where.not(id: friendly_hero_ids + params[:enemies] + params[:bans])
    respond_to do |format|
      format.json
    end
  end
end
