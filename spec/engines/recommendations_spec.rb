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
    create(:role, name: :roamer)
    create(:role, name: :durable)
    create(:role, name: :escape)
    create(:role, name: :semi_carry)
    create(:role, name: :support)

    broodmother.add_role(:pusher, 3)
    broodmother.add_role(:carry, 2)
    broodmother.add_role(:escape, 1)

    batrider.add_role(:initiator, 3)
    batrider.add_role(:disabler, 2)
    batrider.add_role(:nuker, 2)
    batrider.add_role(:escape, 1)

    undying.add_role(:durable, 3)
    undying.add_role(:pusher, 2)
    undying.add_role(:disabler, 1)
    undying.add_role(:initiator, 3)

    ancient_apparition.add_role(:support, 3)
    ancient_apparition.add_role(:disabler, 2)

    faceless_void.add_role(:carry, 3)
    faceless_void.add_role(:initiator, 2)
    faceless_void.add_role(:disabler, 2)
    faceless_void.add_role(:escape, 2)

    viper.add_role(:carry, 2)
    viper.add_role(:durable, 2)
    viper.add_role(:ganker, 2)

    bane.add_role(:disabler, 3)
    bane.add_role(:nuker, 2)
    bane.add_role(:support, 1)

    ursa.add_role(:carry, 3)
    ursa.add_role(:jungler, 3)
    ursa.add_role(:durable, 1)

    juggernaut.add_role(:carry, 3)
    juggernaut.add_role(:pusher, 2)

    alchemist.add_role(:durable, 2)
    alchemist.add_role(:carry, 2)
    alchemist.add_role(:disabler, 2)

    alchemist.add_strong_against(broodmother)
    ursa.add_strong_against(ancient_apparition)
    batrider.add_strong_against(ursa)
  end

  describe 'role-dependent scores' do
    let(:role_values) { Recommendations.calculate_role_values(friendly_heroes) }

    it 'calculates filled role score properly' do
      expect(Recommendations.roles_filled_score(role_values)).to eql(16)
    end

    it 'calculates support bonus properly' do
      expect(Recommendations.support_bonus(role_values[:support], role_values[:lane_support])).to eql(0)
    end

    it 'calculates carry bonus properly' do
      expect(Recommendations.carry_bonus(role_values[:carry])).to eql(30)
    end

    it 'calculates disabler bonus properly' do
      expect(Recommendations.disabler_bonus(role_values[:disabler])).to eql(5)
    end

    it 'calculates initiator bonus properly' do
      expect(Recommendations.initiator_bonus(role_values[:initiator])).to eql(5)
    end

    it 'calculates durable bonus properly' do
      expect(Recommendations.durable_bonus(role_values[:durable])).to eql(5)
    end

    it 'calculates mid bonus properly' do
      expect(Recommendations.mid_bonus(friendly_heroes)).to eql(5)
    end

    it 'calculates counter value properly' do
      expect(Recommendations.counter_value(friendly_heroes, enemy_heroes)).to eql(-3)
    end

    it 'calculates total score properly' do
      expect(Recommendations.score(friendly_heroes, enemy_heroes)).to eql(68)
    end
  end

  it 'calculates melee and ranged bonus properly' do
    expect(Recommendations.melee_and_ranged_bonus(friendly_heroes)).to eql(5)
  end
end
