namespace :db do
  namespace :seed do
    desc 'Adds heroes to the database'
    task 'heroes' => 'environment' do
      outworld_devourer = FactoryGirl.create(:hero, name: "Outworld Devourer",
                                                    strength: 19,
                                                    agility: 24,
                                                    intelligence: 26,
                                                    strength_increase: 1.85,
                                                    agility_increase: 2,
                                                    intelligence_increase: 26,
                                                    armor: 5.36,
                                                    movement_speed: 315,
                                                    main_attribute: :intelligence)
    end

    desc 'Adds roles to the database'
    task 'roles' => 'environment' do
      FactoryGirl.create(:role, name: :lane_support)
      FactoryGirl.create(:role, name: :carry)
      FactoryGirl.create(:role, name: :disabler)
      FactoryGirl.create(:role, name: :ganker)
      FactoryGirl.create(:role, name: :nuker)
      FactoryGirl.create(:role, name: :initiator)
      FactoryGirl.create(:role, name: :jungler)
      FactoryGirl.create(:role, name: :pusher)
      FactoryGirl.create(:role, name: :roamer)
      FactoryGirl.create(:role, name: :durable)
      FactoryGirl.create(:role, name: :escape)
      FactoryGirl.create(:role, name: :semi_carry)
      FactoryGirl.create(:role, name: :support)
    end
  end
end
