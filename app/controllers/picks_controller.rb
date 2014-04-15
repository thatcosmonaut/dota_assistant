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

    if @enemies.count > 1
      default_build_ids = @enemies.map { |enemy| enemy.builds.first.id }
      default_builds = Build.where(id: default_build_ids, hero_id: params[:enemies])
      @ban_recommendations = (Recommendations.pick_recommendations default_builds, @friendlies, @bans, 'BALANCED').first
    end

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

    friendly_hero_ids = Build.where(id: params[:friendlies]).pluck(:hero_id)

    @remaining = Build.where.not(hero_id: friendly_hero_ids + params[:enemies] + params[:bans])
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
