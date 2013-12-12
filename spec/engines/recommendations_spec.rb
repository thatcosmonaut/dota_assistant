require 'spec_helper'

describe "recommendation engine" do

  let(:ancient_apparition) { create(:hero, name: "Ancient Apparition",
                                    attack_type: :ranged,
                                    main_attribute: :intelligence,
                                    viable_solo: 0)}

  let(:broodmother) { create(:hero, name: "Broodmother",
                                            attack_type: :melee,
                                            main_attribute: :agility,
                                            viable_solo: 1)}

  let(:batrider) { create(:hero, name: "Batrider",
                                           attack_type: :ranged,
                                           main_attribute: :intelligence,
                                           viable_solo: 3)}

  let(:faceless_void) { create(:hero, name: "Faceless Void",
                                            attack_type: :melee,
                                            main_attribute: :agility,
                                            viable_solo: 0)}

  let(:undying) { create(:hero, name: "Undying",
                                        attack_type: :melee,
                                        main_attribute: :strength,
                                        viable_solo: 1)}

  let(:friendly_heroes) { [ancient_apparition, batrider, broodmother, faceless_void, undying] }

  let(:alchemist) { FactoryGirl.create(:hero, name: "Alchemist",
                                            attack_type: :melee,
                                            main_attribute: :strength,
                                            viable_solo: 0) }

  let(:bane) { FactoryGirl.create(:hero, name: "Bane",
                                       attack_type: :ranged,
                                       strength: 22,
                                       agility: 22,
                                       intelligence: 22,
                                       strength_increase: 2.1,
                                       agility_increase: 2.1,
                                       intelligence_increase: 2.1,
                                       armor: 4.08,
                                       movement_speed: 315,
                                       main_attribute: :intelligence,
                                       viable_solo: 3) }

  let(:juggernaut) { FactoryGirl.create(:hero, name: "Juggernaut",
                                             attack_type: :melee,
                                             strength: 20,
                                             agility: 20,
                                             intelligence: 14,
                                             strength_increase: 1.9,
                                             agility_increase: 2.85,
                                             intelligence_increase: 1.4,
                                             armor: 3.8,
                                             movement_speed: 305,
                                             main_attribute: :agility,
                                             viable_solo: 1) }

  let(:ursa) { FactoryGirl.create(:hero, name: "Ursa",
                                       attack_type: :melee,
                                       main_attribute: :agility,
                                       viable_solo: 0) }

  let(:viper) { FactoryGirl.create(:hero, name: "Viper",
                                        attack_type: :ranged,
                                        main_attribute: :agility,
                                        viable_solo: 3)}

  let(:enemy_heroes) { [alchemist, bane, juggernaut, ursa, viper] }

  before do
    create(:role, name: :lane_support)
    create(:role, name: :carry)
    create(:role, name: :disabler)
    create(:role, name: :ganker)
    create(:role, name: :nuker)
    create(:role, name: :initiator)
    create(:role, name: :jungler)
    create(:role, name: :pusher)
    create(:role, name: :durable)
    create(:role, name: :escape)
    create(:role, name: :support)

    broodmother.add_role(:pusher, 3)
    broodmother.add_role(:carry, 2)
    broodmother.add_role(:escape, 1)
    broodmother.save_role_elements

    batrider.add_role(:initiator, 3)
    batrider.add_role(:disabler, 2)
    batrider.add_role(:nuker, 2)
    batrider.add_role(:escape, 1)
    batrider.save_role_elements

    undying.add_role(:durable, 3)
    undying.add_role(:pusher, 2)
    undying.add_role(:disabler, 1)
    undying.add_role(:initiator, 3)
    undying.save_role_elements

    ancient_apparition.add_role(:support, 3)
    ancient_apparition.add_role(:disabler, 2)
    ancient_apparition.save_role_elements

    faceless_void.add_role(:carry, 3)
    faceless_void.add_role(:initiator, 2)
    faceless_void.add_role(:disabler, 2)
    faceless_void.add_role(:escape, 2)
    faceless_void.save_role_elements

    viper.add_role(:carry, 2)
    viper.add_role(:durable, 2)
    viper.add_role(:ganker, 2)
    viper.save_role_elements

    bane.add_role(:disabler, 3)
    bane.add_role(:nuker, 2)
    bane.add_role(:support, 1)
    bane.save_role_elements

    ursa.add_role(:carry, 3)
    ursa.add_role(:jungler, 3)
    ursa.add_role(:durable, 1)
    ursa.save_role_elements

    juggernaut.add_role(:carry, 3)
    juggernaut.add_role(:pusher, 2)
    juggernaut.save_role_elements

    alchemist.add_role(:durable, 2)
    alchemist.add_role(:carry, 2)
    alchemist.add_role(:disabler, 2)
    alchemist.save_role_elements
  end

  describe 'scoring' do
    it 'calculates total score properly' do
      expect(Recommendations.calculate_score(friendly_heroes)).to eql(77)
    end
  end
end
