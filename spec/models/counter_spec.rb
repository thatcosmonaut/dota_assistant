require 'spec_helper'

describe 'counter' do
  let(:ancient_apparition) { create(:hero, name: "Ancient Apparition",
                                    attack_type: :ranged,
                                    main_attribute: :intelligence,
                                    viable_solo: 0)}

  let(:broodmother) { create(:hero, name: "Broodmother",
                                            attack_type: :melee,
                                            main_attribute: :agility,
                                            viable_solo: 1)}

  before do
    ancient_apparition.add_weak_against(broodmother)
  end

  it 'weak against' do
    expect(ancient_apparition.weak_against).to include(broodmother)
  end

  it 'strong against' do
    expect(broodmother.strong_against).to include(ancient_apparition)
  end
end
