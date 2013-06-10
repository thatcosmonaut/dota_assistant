namespace :db do
  namespace :seed do
    desc 'Adds heroes to the database'
    task 'heroes' => 'environment' do
      #radiant strength
      earthshaker = FactoryGirl.create(:hero, name: "Earthshaker",
                                              attack_type: :melee,
                                              strength: 22,
                                              agility: 12,
                                              intelligence: 16,
                                              strength_increase: 2.5,
                                              agility_increase: 1.4,
                                              intelligence_increase: 1.8,
                                              armor: 2.68,
                                              movement_speed: 300,
                                              main_attribute: :strength)

      earthshaker.add_role(:initiator, 2)
      earthshaker.add_role(:disabler, 1)
      earthshaker.add_role(:support, 2)
      earthshaker.add_role(:lane_support, 1)

      sven = FactoryGirl.create(:hero, name: "Sven",
                                       attack_type: :melee,
                                       strength: 23,
                                       agility: 21,
                                       intelligence: 14,
                                       strength_increase: 2.7,
                                       agility_increase: 2,
                                       intelligence_increase: 1.3,
                                       armor: 1.94,
                                       movement_speed: 295,
                                       main_attribute: :strength)

      sven.add_role(:disabler, 2)
      sven.add_role(:initiator, 2)
      sven.add_role(:carry, 2)
      sven.add_role(:support, 1)

      tiny = FactoryGirl.create(:hero, name: "Tiny",
                                       attack_type: :melee,
                                       strength: 24,
                                       agility: 9,
                                       intelligence: 14,
                                       strength_increase: 3,
                                       agility_increase: 0.9,
                                       intelligence_increase: 1.6,
                                       armor: 0.26,
                                       movement_speed: 285,
                                       main_attribute: :strength)

      tiny.add_role(:disabler, 1)
      tiny.add_role(:nuker, 2)
      tiny.add_role(:initiator, 2)
      tiny.add_role(:durable, 2)

      kunkka = FactoryGirl.create(:hero, name: "Kunkka",
                                         attack_type: :melee,
                                         strength: 24,
                                         agility: 14,
                                         intelligence: 18,
                                         strength_increase: 3,
                                         agility_increase: 1.3,
                                         intelligence_increase: 1.5,
                                         armor: 1.96,
                                         movement_speed: 300,
                                         main_attribute: :strength)

      kunkka.add_role(:disabler, 2)
      kunkka.add_role(:initiator, 1)
      kunkka.add_role(:carry, 2)
      kunkka.add_role(:durable, 1)

      #radiant agility
      anti_mage = FactoryGirl.create(:hero, name: "Anti-Mage",
                                            attack_type: :melee,
                                            strength: 20,
                                            agility: 22,
                                            intelligence: 15,
                                            strength_increase: 1.2,
                                            agility_increase: 2.8,
                                            intelligence_increase: 1.8,
                                            armor: 2.08,
                                            movement_speed: 315,
                                            main_attribute: :agility)

      anti_mage.add_role(:carry, 3)
      anti_mage.add_role(:escape, 2)

      drow_ranger = FactoryGirl.create(:hero, name: "Drow Ranger",
                                              attack_type: :ranged,
                                              strength: 17,
                                              agility: 26,
                                              intelligence: 15,
                                              strength_increase: 1.9,
                                              agility_increase: 1.9,
                                              intelligence_increase: 1.4,
                                              armor: 0.64,
                                              movement_speed: 300,
                                              main_attribute: :agility)

      drow_ranger.add_role(:carry, 3)

      juggernaut = FactoryGirl.create(:hero, name: "Juggernaut",
                                             attack_type: :melee,
                                             strength: 20,
                                             agility: 20,
                                             intelligence: 14,
                                             strength_increase: 1.9,
                                             agility_increase: 2.85,
                                             intelligence_increase: 1.4,
                                             armor: 3.8,
                                             movement_speed: 305,
                                             main_attribute: :agility)

      juggernaut.add_role(:carry, 3)
      juggernaut.add_role(:pusher, 2)

      mirana = FactoryGirl.create(:hero, name: "Mirana",
                                         attack_type: :ranged,
                                         strength: 17,
                                         agility: 20,
                                         intelligence: 17,
                                         strength_increase: 1.85,
                                         agility_increase: 2.75,
                                         intelligence_increase: 1.65,
                                         armor: 1.8,
                                         movement_speed: 300,
                                         main_attribute: :agility)
      
      mirana.add_role(:carry, 2)
      mirana.add_role(:nuker, 2)
      mirana.add_role(:disabler, 2)
      mirana.add_role(:escape, 1)

      #radiant intelligence
      crystal_maiden = FactoryGirl.create(:hero, name: "Crystal Maiden",
                                                 attack_type: :ranged,
                                                 strength: 16,
                                                 agility: 16,
                                                 intelligence: 21,
                                                 strength_increase: 1.7,
                                                 agility_increase: 1.6,
                                                 intelligence_increase: 2.9,
                                                 armor: 1.24,
                                                 movement_speed: 280,
                                                 main_attribute: :intelligence)

      crystal_maiden.add_role(:support, 2)
      crystal_maiden.add_role(:lane_support, 3)
      crystal_maiden.add_role(:nuker, 1)
      crystal_maiden.add_role(:disabler, 2)

      puck = FactoryGirl.create(:hero, name: "Puck",
                                       attack_type: :ranged,
                                       strength: 15,
                                       agility: 22,
                                       intelligence: 25,
                                       strength_increase: 1.7,
                                       agility_increase: 1.7,
                                       intelligence_increase: 2.4,
                                       armor: 2.08,
                                       movement_speed: 295,
                                       main_attribute: :intelligence)

      puck.add_role(:initiator, 2)
      puck.add_role(:nuker, 1)
      puck.add_role(:disabler, 2)
      puck.add_role(:escape, 2)

      storm_spirit = FactoryGirl.create(:hero, name: "Storm Spirit",
                                               attack_type: :ranged,
                                               strength: 19,
                                               agility: 22,
                                               intelligence: 23,
                                               strength_increase: 1.5,
                                               agility_increase: 1.8,
                                               intelligence_increase: 2.6,
                                               armor: 5.08,
                                               movement_speed: 295,
                                               main_attribute: :intelligence)

      storm_spirit.add_role(:carry, 2)
      storm_spirit.add_role(:initiator, 1)
      storm_spirit.add_role(:escape, 3)
      storm_spirit.add_role(:disabler, 1)

      windrunner = FactoryGirl.create(:hero, name: "Windrunner",
                                             attack_type: :ranged,
                                             strength: 15,
                                             agility: 17,
                                             intelligence: 22,
                                             strength_increase: 2.5,
                                             agility_increase: 1.4,
                                             intelligence_increase: 2.6,
                                             armor: 1.38,
                                             movement_speed: 295,
                                             main_attribute: :intelligence)

      windrunner.add_role(:disabler, 2)
      windrunner.add_role(:nuker, 1)
      windrunner.add_role(:support, 2)
      windrunner.add_role(:escape, 2)

      #dire strength
      axe = FactoryGirl.create(:hero, name: "Axe",
                                      attack_type: :melee,
                                      strength: 25,
                                      agility: 20,
                                      intelligence: 18,
                                      strength_increase: 2.5,
                                      agility_increase: 2.2,
                                      intelligence_increase: 1.6,
                                      armor: 1.8,
                                      movement_speed: 290,
                                      main_attribute: :strength)
      
      axe.add_role(:durable, 2)
      axe.add_role(:initiator, 2)
      axe.add_role(:disabler, 1)
      axe.add_role(:jungler, 2)

      pudge = FactoryGirl.create(:hero, name: "Pudge",
                                        attack_type: :melee,
                                        strength: 25,
                                        agility: 14,
                                        intelligence: 14,
                                        strength_increase: 3.2,
                                        agility_increase: 1.5,
                                        intelligence_increase: 1.5,
                                        armor: 0.96,
                                        movement_speed: 285,
                                        main_attribute: :strength)

      pudge.add_role(:durable, 3)
      pudge.add_role(:disabler, 2)

      sand_king = FactoryGirl.create(:hero, name: "Sand King",
                                            attack_type: :melee,
                                            strength: 18,
                                            agility: 19,
                                            intelligence: 16,
                                            strength_increase: 2.6,
                                            agility_increase: 2.1,
                                            intelligence_increase: 1.8,
                                            armor: 2.66,
                                            movement_speed: 300,
                                            main_attribute: :strength)

      sand_king.add_role(:initiator, 3)
      sand_king.add_role(:disabler, 2)
      sand_king.add_role(:nuker, 2)

      slardar = FactoryGirl.create(:hero, name: "Slardar",
                                          attack_type: :melee,
                                          strength: 21,
                                          agility: 17,
                                          intelligence: 15,
                                          strength_increase: 2.8,
                                          agility_increase: 2.4,
                                          intelligence_increase: 1.5,
                                          armor: 5.38,
                                          movement_speed: 300,
                                          main_attribute: :strength)

      slardar.add_role(:carry, 2)
      slardar.add_role(:durable, 2)
      slardar.add_role(:disabler, 2)
      slardar.add_role(:initiator, 2)

      #dire agility
      bloodseeker = FactoryGirl.create(:hero, name: "Bloodseeker",
                                              attack_type: :melee,
                                              strength: 23,
                                              agility: 24,
                                              intelligence: 18,
                                              strength_increase: 2,
                                              agility_increase: 3,
                                              intelligence_increase: 1.7,
                                              armor: 3.36,
                                              movement_speed: 305,
                                              main_attribute: :agility)

      bloodseeker.add_role(:carry, 3)
      bloodseeker.add_role(:jungler, 2)

      shadow_fiend = FactoryGirl.create(:hero, name: "Shadow Fiend",
                                               attack_type: :ranged,
                                               strength: 15,
                                               agility: 20,
                                               intelligence: 18,
                                               strength_increase: 2,
                                               agility_increase: 2.9,
                                               intelligence_increase: 2,
                                               armor: 1.8,
                                               movement_speed: 305,
                                               main_attribute: :agility)

      shadow_fiend.add_role(:carry, 3)
      shadow_fiend.add_role(:nuker, 3)

      razor = FactoryGirl.create(:hero, name: "Razor",
                                        attack_type: :ranged,
                                        strength: 21,
                                        agility: 22,
                                        intelligence: 19,
                                        strength_increase: 1.7,
                                        agility_increase: 2,
                                        intelligence_increase: 1.8,
                                        armor: 2.08,
                                        movement_speed: 295,
                                        main_attribute: :agility)

      razor.add_role(:carry, 2)
      razor.add_role(:durable, 2)
      razor.add_role(:nuker, 2)

      venomancer = FactoryGirl.create(:hero, name: "Venomancer",
                                             attack_type: :ranged,
                                             strength: 18,
                                             agility: 22,
                                             intelligence: 15,
                                             strength_increase: 1.85,
                                             agility_increase: 2.6,
                                             intelligence_increase: 1.75,
                                             armor: 3.08,
                                             movement_speed: 290,
                                             main_attribute: :agility)

      venomancer.add_role(:support, 3)
      venomancer.add_role(:nuker, 1)
      venomancer.add_role(:initiator, 1)
      venomancer.add_role(:pusher, 2)

      #dire intelligence
      bane = FactoryGirl.create(:hero, name: "Bane",
                                       attack_type: :ranged,
                                       strength: 22,
                                       agility: 22,
                                       intelligence: 22,
                                       strength_increase: 2.1,
                                       agility_increase: 2.1,
                                       intelligence_increase: 2.1,
                                       armor: 4.08,
                                       movement_speed: 315,
                                       main_attribute: :intelligence)

      bane.add_role(:disabler, 3)
      bane.add_role(:nuker, 2)
      bane.add_role(:support, 1)

      lich = FactoryGirl.create(:hero, name: "Lich",
                                       attack_type: :ranged,
                                       strength: 18,
                                       agility: 15,
                                       intelligence: 18,
                                       strength_increase: 1.55,
                                       agility_increase: 2,
                                       intelligence_increase: 3.25,
                                       armor: 1.1,
                                       movement_speed: 315,
                                       main_attribute: :intelligence)

      lich.add_role(:support, 2)
      lich.add_role(:lane_support, 3)
      lich.add_role(:nuker, 1)

      lion = FactoryGirl.create(:hero, name: "Lion",
                                       attack_type: :ranged,
                                       strength: 16,
                                       agility: 15,
                                       intelligence: 22,
                                       strength_increase: 1.7,
                                       agility_increase: 1.5,
                                       intelligence_increase: 3,
                                       armor: 1.1,
                                       movement_speed: 290,
                                       main_attribute: :intelligence)

      lion.add_role(:disabler, 3)
      lion.add_role(:nuker, 3)
      lion.add_role(:lane_support, 2)
      lion.add_role(:support, 1)

      witch_doctor = FactoryGirl.create(:hero, name: "Witch Doctor",
                                               attack_type: :ranged,
                                               strength: 16,
                                               agility: 13,
                                               intelligence: 24,
                                               strength_increase: 1.8,
                                               agility_increase: 1.4,
                                               intelligence_increase: 2.9,
                                               armor: 0.82,
                                               movement_speed: 305,
                                               main_attribute: :intelligence)

      witch_doctor.add_role(:support, 3)
      witch_doctor.add_role(:disabler, 2)

      outworld_devourer = FactoryGirl.create(:hero, name: "Outworld Devourer",
                                                    attack_type: :ranged,
                                                    strength: 19,
                                                    agility: 24,
                                                    intelligence: 26,
                                                    strength_increase: 1.85,
                                                    agility_increase: 2,
                                                    intelligence_increase: 26,
                                                    armor: 5.36,
                                                    movement_speed: 315,
                                                    main_attribute: :intelligence)

      outworld_devourer.add_role(:carry, 3)


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
