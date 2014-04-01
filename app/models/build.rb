class Build < ActiveRecord::Base
  VALID_ROLES = [
    :carry,
    :disabler,
    :durable,
    :ganker,
    :initiator,
    :jungler,
    :lane_support,
    :nuker,
    :pusher,
    :support
  ]

  belongs_to :hero

  validates :name,
            :carry,
            :disabler,
            :durable,
            :ganker,
            :initiator,
            :jungler,
            :lane_support,
            :nuker,
            :pusher,
            :support,
            :hero_id,
            presence: true

  def balanced_role_elements
    Vector.elements(role_elements[0..1] + role_elements[3..7] + role_elements[9..role_elements.length])
  end

  def jungling_role_elements
    Vector.elements(role_elements)
  end

  def trilane_role_elements
    Vector.elements(role_elements[0..7] + role_elements[9..role_elements.length])
  end

  def role_elements
    [
      hero.attack_type == 'ranged' ? 1 : 0,
      hero.viable_mid,
      hero.viable_offlane,
      carry,
      disabler,
      durable,
      ganker,
      initiator,
      jungler,
      lane_support,
      nuker,
      pusher,
      support
    ]
  end

  def hero_name
    hero.name
  end
end
