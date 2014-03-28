class Build < ActiveRecord::Base
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
end
