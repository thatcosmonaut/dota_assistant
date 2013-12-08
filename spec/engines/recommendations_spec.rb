require 'spec_helper'

describe "recommendation engine" do

  before(:each) do
    create(:role, name: :lane_support)
    create(:role, name: :carry)
    create(:role, name: :disabler)
    create(:role, name: :ganker)
    create(:role, name: :nuker)
    create(:role, name: :initiator)
    create(:role, name: :jungler)
    create(:role, name: :pusher)
    create(:role, name: :roamer)
    create(:role, name: :durable)
    create(:role, name: :escape)
    create(:role, name: :semi_carry)
    create(:role, name: :support)
  end

  let(:broodmother) { create(:hero, name: "Broodmother",
                                            attack_type: :melee,
                                            main_attribute: :agility,
                                            viable_solo: 1)}

  let(:undying) { create(:hero, name: "Undying",
                                        attack_type: :melee,
                                        main_attribute: :strength,
                                        viable_solo: 1) }

  it "calculates team roles score properly" do
    broodmother.add_role(:pusher, 3)
    broodmother.add_role(:carry, 2)
    broodmother.add_role(:escape, 1)

    undying.add_role(:durable, 3)
    undying.add_role(:pusher, 2)
    undying.add_role(:disabler, 1)
    undying.add_role(:initiator, 3)

    score = Recommendations.role_score [broodmother, undying]

    puts score
  end
end
