namespace :db do
  desc 'Adds all hero related data to the database'
  task 'populate' => ['seed:roles', 'seed:heroes']

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
                                              main_attribute: :strength,
                                              viable_solo: 0)

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
                                       main_attribute: :strength,
                                       viable_solo: 0)

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
                                       main_attribute: :strength,
                                       viable_solo: 1)

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
                                         main_attribute: :strength,
                                         viable_solo: 2)

      kunkka.add_role(:disabler, 2)
      kunkka.add_role(:initiator, 1)
      kunkka.add_role(:carry, 2)
      kunkka.add_role(:durable, 1)

      beastmaster = FactoryGirl.create(:hero, name: "Beastmaster",
                                              attack_type: :melee,
                                              main_attribute: :strength,
                                              viable_solo: 1)

      beastmaster.add_role(:initiator, 2)
      beastmaster.add_role(:disabler, 2)
      beastmaster.add_role(:durable, 2)

      dragon_knight = FactoryGirl.create(:hero, name: "Dragon Knight",
                                                attack_type: :melee,
                                                main_attribute: :strength,
                                                viable_solo: 0)

      dragon_knight.add_role(:carry, 2)
      dragon_knight.add_role(:durable, 3)
      dragon_knight.add_role(:disabler, 1)
      dragon_knight.add_role(:pusher, 1)

      clockwerk = FactoryGirl.create(:hero, name: "Clockwerk",
                                            attack_type: :melee,
                                            main_attribute: :strength,
                                            viable_solo: 2)

      clockwerk.add_role(:initiator, 3)
      clockwerk.add_role(:durable, 1)

      omniknight = FactoryGirl.create(:hero, name: "Omniknight",
                                             attack_type: :melee,
                                             main_attribute: :strength,
                                             viable_solo: 0)

      huskar = FactoryGirl.create(:hero, name: "Huskar",
                                         attack_type: :ranged,
                                         main_attribute: :strength,
                                         viable_solo: 3)

      huskar.add_role(:carry, 2)
      huskar.add_role(:initiator, 2)
      huskar.add_role(:durable, 2)

      alchemist = FactoryGirl.create(:hero, name: "Alchemist",
                                            attack_type: :melee,
                                            main_attribute: :strength,
                                            viable_solo: 0)

      alchemist.add_role(:durable, 2)
      alchemist.add_role(:carry, 2)
      alchemist.add_role(:disabler, 2)

      brewmaster = FactoryGirl.create(:hero, name: "Brewmaster",
                                             attack_type: :melee,
                                             main_attribute: :strength,
                                             viable_solo: 1)

      brewmaster.add_role(:carry, 2)
      brewmaster.add_role(:durable, 3)
      brewmaster.add_role(:initiator, 1)
      brewmaster.add_role(:pusher, 1)

      treant_protector = FactoryGirl.create(:hero, name: "Treant Protector",
                                                   attack_type: :melee,
                                                   main_attribute: :strength,
                                                   viable_solo: 0)

      treant_protector.add_role(:durable, 2)
      treant_protector.add_role(:initiator, 2)
      treant_protector.add_role(:lane_support, 3)
      treant_protector.add_role(:disabler, 1)

      io = FactoryGirl.create(:hero, name: "Io",
                                     attack_type: :ranged,
                                     main_attribute: :strength,
                                     viable_solo: 0)

      io.add_role(:lane_support, 3)
      io.add_role(:nuker, 2)

      centaur_warrunner = FactoryGirl.create(:hero, name: "Centaur Warrunner",
                                                    attack_type: :melee,
                                                    main_attribute: :strength,
                                                    viable_solo: 0)

      centaur_warrunner.add_role(:durable, 3)
      centaur_warrunner.add_role(:disabler, 2)
      centaur_warrunner.add_role(:initiator, 2)

      timbersaw = FactoryGirl.create(:hero, name: "Timbersaw",
                                            attack_type: :melee,
                                            main_attribute: :strength,
                                            viable_solo: 1)

      timbersaw.add_role(:ganker, 2)
      timbersaw.add_role(:initiator, 2)
      timbersaw.add_role(:durable, 2)

      bristleback = FactoryGirl.create(:hero, name: "Bristleback",
                                              attack_type: :melee,
                                              main_attribute: :strength,
                                              viable_solo: 1)

      bristleback.add_role(:durable, 3)
      bristleback.add_role(:initiator, 1)
      bristleback.add_role(:disabler, 1)

      tusk = FactoryGirl.create(:hero, name: "Tusk",
                                       attack_type: :melee,
                                       main_attribute: :strength,
                                       viable_solo: 1)

      tusk.add_role(:initiator, 3)
      tusk.add_role(:durable, 2)

      elder_titan = FactoryGirl.create(:hero, name: "Elder Titan",
                                              attack_type: :melee,
                                              main_attribute: :strength,
                                              viable_solo: 0)

      elder_titan.add_role(:initiator, 3)
      elder_titan.add_role(:durable, 2)

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
                                            main_attribute: :agility,
                                            viable_solo: 0)

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
                                              main_attribute: :agility,
                                              viable_solo: 3)

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
                                             main_attribute: :agility,
                                             viable_solo: 1)

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
                                         main_attribute: :agility,
                                         viable_solo: 2)
      
      mirana.add_role(:carry, 2)
      mirana.add_role(:nuker, 2)
      mirana.add_role(:disabler, 2)
      mirana.add_role(:escape, 1)

      morphling = FactoryGirl.create(:hero, name: "Morphling",
                                            attack_type: :ranged,
                                            main_attribute: :agility,
                                            viable_solo: 0)

      morphling.add_role(:carry, 3)
      morphling.add_role(:escape, 2)
      morphling.add_role(:initiator, 1)
      morphling.add_role(:nuker, 1)

      phantom_lancer = FactoryGirl.create(:hero, name: "Phantom Lancer",
                                                 attack_type: :melee,
                                                 main_attribute: :agility,
                                                 viable_solo: 2)

      phantom_lancer.add_role(:carry, 3)
      phantom_lancer.add_role(:escape, 2)
      phantom_lancer.add_role(:pusher, 2)

      vengeful_spirit = FactoryGirl.create(:hero, name: "Vengeful Spirit",
                                                  attack_type: :ranged,
                                                  main_attribute: :agility,
                                                  viable_solo: 2)

      vengeful_spirit.add_role(:support, 3)
      vengeful_spirit.add_role(:disabler, 2)
      vengeful_spirit.add_role(:initiator, 2)

      riki = FactoryGirl.create(:hero, name: "Riki",
                                       attack_type: :melee,
                                       main_attribute: :agility,
                                       viable_solo: 1)

      riki.add_role(:carry, 3)
      riki.add_role(:escape, 3)

      sniper = FactoryGirl.create(:hero, name: "Sniper",
                                         attack_type: :ranged,
                                         main_attribute: :agility,
                                         viable_solo: 3)

      sniper.add_role(:carry, 3)

      templar_assassin = FactoryGirl.create(:hero, name: "Templar Assassin",
                                                   attack_type: :ranged,
                                                   main_attribute: :agility,
                                                   viable_solo: 3)

      templar_assassin.add_role(:carry, 2)
      templar_assassin.add_role(:escape, 2)
      templar_assassin.add_role(:ganker, 2)

      luna = FactoryGirl.create(:hero, name: "Luna",
                                       attack_type: :ranged,
                                       main_attribute: :agility,
                                       viable_solo: 3)

      luna.add_role(:carry, 3)
      luna.add_role(:nuker, 3)

      bounty_hunter = FactoryGirl.create(:hero, name: "Bounty Hunter",
                                                attack_type: :melee,
                                                main_attribute: :agility,
                                                viable_solo: 1)

      bounty_hunter.add_role(:carry, 2)
      bounty_hunter.add_role(:escape, 2)
      bounty_hunter.add_role(:nuker, 2)

      ursa = FactoryGirl.create(:hero, name: "Ursa",
                                       attack_type: :melee,
                                       main_attribute: :agility,
                                       viable_solo: 0)

      ursa.add_role(:carry, 3)
      ursa.add_role(:jungler, 3)
      ursa.add_role(:durable, 1)

      gyrocopter = FactoryGirl.create(:hero, name: "Gyrocopter",
                                             attack_type: :ranged,
                                             main_attribute: :agility,
                                             viable_solo: 3)

      gyrocopter.add_role(:disabler, 1)
      gyrocopter.add_role(:initiator, 2)
      gyrocopter.add_role(:nuker, 3)

      lone_druid = FactoryGirl.create(:hero, name: "Lone Druid",
                                             attack_type: :ranged,
                                             main_attribute: :agility,
                                             viable_solo: 3)

      lone_druid.add_role(:carry, 3)
      lone_druid.add_role(:durable, 3)
      lone_druid.add_role(:pusher, 2)
      lone_druid.add_role(:jungler, 3)

      naga_siren = FactoryGirl.create(:hero, name: "Naga Siren",
                                             attack_type: :melee,
                                             main_attribute: :agility,
                                             viable_solo: 2)

      naga_siren.add_role(:carry, 2)
      naga_siren.add_role(:disabler, 1)
      naga_siren.add_role(:pusher, 2)
      naga_siren.add_role(:escape, 1)

      troll_warlord = FactoryGirl.create(:hero, name: "Troll Warlord",
                                                attack_type: :ranged,
                                                main_attribute: :agility,
                                                viable_solo: 1)

      troll_warlord.add_role(:carry, 3)

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
                                                 main_attribute: :intelligence, 
                                                 viable_solo: 0)

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
                                       main_attribute: :intelligence,
                                       viable_solo: 2)

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
                                               main_attribute: :intelligence,
                                               viable_solo: 2)

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
                                             main_attribute: :intelligence,
                                             viable_solo: 0)

      windrunner.add_role(:disabler, 2)
      windrunner.add_role(:nuker, 1)
      windrunner.add_role(:support, 2)
      windrunner.add_role(:escape, 2)

      zeus = FactoryGirl.create(:hero, name: "Zeus",
                                       attack_type: :ranged,
                                       main_attribute: :intelligence,
                                       viable_solo: 2)

      zeus.add_role(:nuker, 3)
      zeus.add_role(:support, 1)

      lina = FactoryGirl.create(:hero, name: "Lina",
                                       attack_type: :ranged,
                                       main_attribute: :intelligence,
                                       viable_solo: 3)

      shadow_shaman = FactoryGirl.create(:hero, name: "Shadow Shaman",
                                                attack_type: :ranged,
                                                main_attribute: :intelligence,
                                                viable_solo: 1)

      shadow_shaman.add_role(:pusher, 2)
      shadow_shaman.add_role(:disabler, 3)
      shadow_shaman.add_role(:nuker, 2)
      shadow_shaman.add_role(:support, 2)

      enchantress = FactoryGirl.create(:hero, name: "Enchantress",
                                              attack_type: :ranged,
                                              main_attribute: :intelligence,
                                              viable_solo: 0)

      enchantress.add_role(:support, 1)
      enchantress.add_role(:pusher, 1)
      enchantress.add_role(:durable, 2)
      enchantress.add_role(:jungler, 3)

      natures_prophet = FactoryGirl.create(:hero, name: "Nature's Prophet",
                                                  attack_type: :ranged,
                                                  main_attribute: :intelligence,
                                                  viable_solo: 0)

      natures_prophet.add_role(:jungler, 2)
      natures_prophet.add_role(:pusher, 3)
      natures_prophet.add_role(:carry, 1)
      natures_prophet.add_role(:escape, 2)

      tinker = FactoryGirl.create(:hero, name: "Tinker",
                                         attack_type: :ranged,
                                         main_attribute: :intelligence,
                                         viable_solo: 3)

      tinker.add_role(:nuker, 2)
      tinker.add_role(:pusher, 3)

      jakiro = FactoryGirl.create(:hero, name: "Jakiro",
                                         attack_type: :ranged,
                                         main_attribute: :intelligence,
                                         viable_solo: 0)

      jakiro.add_role(:nuker, 1)
      jakiro.add_role(:pusher, 1)
      jakiro.add_role(:lane_support, 3)
      jakiro.add_role(:disabler, 2)

      chen = FactoryGirl.create(:hero, name: "Chen",
                                       attack_type: :ranged,
                                       main_attribute: :intelligence,
                                       viable_solo: 0)

      chen.add_role(:support, 3)
      chen.add_role(:jungler, 3)
      chen.add_role(:pusher, 1)

      silencer = FactoryGirl.create(:hero, name: "Silencer",
                                           attack_type: :ranged,
                                           main_attribute: :intelligence,
                                           viable_solo: 1)

      silencer.add_role(:support, 1)
      silencer.add_role(:carry, 2)
      silencer.add_role(:initiator, 3)

      ogre_magi = FactoryGirl.create(:hero, name: "Ogre Magi",
                                            attack_type: :melee,
                                            main_attribute: :intelligence,
                                            viable_solo: 0)

      ogre_magi.add_role(:nuker, 3)
      ogre_magi.add_role(:disabler, 1)
      ogre_magi.add_role(:durable, 2)

      rubick = FactoryGirl.create(:hero, name: "Rubick",
                                         attack_type: :ranged,
                                         main_attribute: :intelligence,
                                         viable_solo: 3)

      rubick.add_role(:disabler, 3)
      rubick.add_role(:pusher, 2)

      disruptor = FactoryGirl.create(:hero, name: "Disruptor",
                                            attack_type: :ranged,
                                            main_attribute: :intelligence,
                                            viable_solo: 0)

      disruptor.add_role(:nuker, 1)
      disruptor.add_role(:support, 3)
      disruptor.add_role(:initiator, 3)
      disruptor.add_role(:disabler, 2)

      keeper_of_the_light = FactoryGirl.create(:hero, name: "Keeper of the Light",
                                                      attack_type: :ranged,
                                                      main_attribute: :intelligence,
                                                      viable_solo: 2)

      keeper_of_the_light.add_role(:pusher, 3)

      skywrath_mage = FactoryGirl.create(:hero, name: "Skywrath Mage",
                                                attack_type: :ranged,
                                                main_attribute: :intelligence,
                                                viable_solo: 3)

      skywrath_mage.add_role(:nuker, 3)
      skywrath_mage.add_role(:support, 1)

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
                                      main_attribute: :strength,
                                      viable_solo: 0)
      
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
                                        main_attribute: :strength,
                                        viable_solo: 3)

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
                                            main_attribute: :strength,
                                            viable_solo: 0)

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
                                          main_attribute: :strength,
                                          viable_solo: 0)

      slardar.add_role(:carry, 2)
      slardar.add_role(:durable, 2)
      slardar.add_role(:disabler, 2)
      slardar.add_role(:initiator, 2)

      tidehunter = FactoryGirl.create(:hero, name: "Tidehunter",
                                             attack_type: :melee,
                                             main_attribute: :strength,
                                             viable_solo: 0)

      tidehunter.add_role(:initiator, 3)
      tidehunter.add_role(:durable, 3)
      tidehunter.add_role(:disabler, 1)
      tidehunter.add_role(:support, 1)

      skeleton_king = FactoryGirl.create(:hero, name: "Skeleton King",
                                                attack_type: :melee,
                                                main_attribute: :strength,
                                                viable_solo: 0)

      skeleton_king.add_role(:carry, 3)
      skeleton_king.add_role(:durable, 3)
      skeleton_king.add_role(:disabler, 1)

      lifestealer = FactoryGirl.create(:hero, name: "Lifestealer",
                                              attack_type: :melee,
                                              main_attribute: :strength,
                                              viable_solo: 0)

      lifestealer.add_role(:carry, 3)
      lifestealer.add_role(:durable, 2)
      lifestealer.add_role(:jungler, 2)
      lifestealer.add_role(:escape, 1)

      night_stalker = FactoryGirl.create(:hero, name: "Night Stalker",
                                                attack_type: :melee,
                                                main_attribute: :strength,
                                                viable_solo: 3)

      night_stalker.add_role(:durable, 2)
      night_stalker.add_role(:initiator, 3)

      doom = FactoryGirl.create(:hero, name: "Doom",
                                       attack_type: :melee,
                                       main_attribute: :strength,
                                       viable_solo: 0)

      doom.add_role(:durable, 3)
      doom.add_role(:carry, 3)
      doom.add_role(:nuker, 2)

      spirit_breaker = FactoryGirl.create(:hero, name: "Spirit Breaker",
                                                 attack_type: :melee,
                                                 main_attribute: :strength,
                                                 viable_solo: 0)

      spirit_breaker.add_role(:durable, 2)
      spirit_breaker.add_role(:carry, 2)
      spirit_breaker.add_role(:initiator, 2)
      spirit_breaker.add_role(:disabler, 2)

      lycanthrope = FactoryGirl.create(:hero, name: "Lycanthrope",
                                              attack_type: :melee,
                                              main_attribute: :strength,
                                              viable_solo: 0)

      lycanthrope.add_role(:carry, 3)
      lycanthrope.add_role(:jungler, 2)
      lycanthrope.add_role(:pusher, 1)
      lycanthrope.add_role(:durable, 2)

      chaos_knight = FactoryGirl.create(:hero, name: "Chaos Knight",
                                               attack_type: :melee,
                                               main_attribute: :strength,
                                               viable_solo: 0)

      chaos_knight.add_role(:carry, 3)
      chaos_knight.add_role(:disabler, 2)
      chaos_knight.add_role(:durable, 2)
      chaos_knight.add_role(:pusher, 1)

      undying = FactoryGirl.create(:hero, name: "Undying",
                                          attack_type: :melee,
                                          main_attribute: :strength,
                                          viable_solo: 1)

      undying.add_role(:durable, 3)
      undying.add_role(:pusher, 2)
      undying.add_role(:disabler, 1)
      undying.add_role(:initiator, 3)

      magnus = FactoryGirl.create(:hero, name: "Magnus",
                                         attack_type: :melee,
                                         main_attribute: :strength,
                                         viable_solo: 3)

      magnus.add_role(:initiator, 3)
      magnus.add_role(:disabler, 2)
      magnus.add_role(:nuker, 2)
      magnus.add_role(:carry, 1)

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
                                              main_attribute: :agility,
                                              viable_solo: 0)

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
                                               main_attribute: :agility,
                                               viable_solo: 3)

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
                                        main_attribute: :agility,
                                        viable_solo: 0)

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
                                             main_attribute: :agility,
                                             viable_solo: 0)

      venomancer.add_role(:support, 3)
      venomancer.add_role(:nuker, 1)
      venomancer.add_role(:initiator, 1)
      venomancer.add_role(:pusher, 2)

      faceless_void = FactoryGirl.create(:hero, name: "Faceless Void",
                                                attack_type: :melee,
                                                main_attribute: :agility,
                                                viable_solo: 0)

      faceless_void.add_role(:carry, 3)
      faceless_void.add_role(:initiator, 2)
      faceless_void.add_role(:disabler, 2)
      faceless_void.add_role(:escape, 2)

      phantom_assassin = FactoryGirl.create(:hero, name: "Phantom Assassin",
                                                   attack_type: :melee,
                                                   main_attribute: :agility,
                                                   viable_solo: 0)

      phantom_assassin.add_role(:carry, 3)
      phantom_assassin.add_role(:escape, 2)

      viper = FactoryGirl.create(:hero, name: "Viper",
                                        attack_type: :ranged,
                                        main_attribute: :agility,
                                        viable_solo: 3)

      viper.add_role(:carry, 2)
      viper.add_role(:durable, 2)
      viper.add_role(:ganker, 2)

      clinkz = FactoryGirl.create(:hero, name: "Clinkz",
                                         attack_type: :ranged,
                                         main_attribute: :agility,
                                         viable_solo: 0)

      clinkz.add_role(:carry, 3)
      clinkz.add_role(:escape, 3)

      broodmother = FactoryGirl.create(:hero, name: "Broodmother",
                                              attack_type: :melee,
                                              main_attribute: :agility,
                                              viable_solo: 1)

      broodmother.add_role(:pusher, 3)
      broodmother.add_role(:carry, 2)
      broodmother.add_role(:escape, 1)

      weaver = FactoryGirl.create(:hero, name: "Weaver",
                                         attack_type: :ranged,
                                         main_attribute: :agility,
                                         viable_solo: 2)

      weaver.add_role(:carry, 3)
      weaver.add_role(:escape, 3)

      spectre = FactoryGirl.create(:hero, name: "Spectre",
                                          attack_type: :melee,
                                          main_attribute: :agility,
                                          viable_solo: 0)

      spectre.add_role(:carry, 3)
      spectre.add_role(:durable, 2)

      meepo = FactoryGirl.create(:hero, name: "Meepo",
                                        attack_type: :melee,
                                        main_attribute: :agility,
                                        viable_solo: 0)

      meepo.add_role(:carry, 3)
      meepo.add_role(:disabler, 2)
      meepo.add_role(:pusher, 2)

      nyx_assassin = FactoryGirl.create(:hero, name: "Nyx Assassin",
                                               attack_type: :melee,
                                               main_attribute: :agility,
                                               viable_solo: 3)

      nyx_assassin.add_role(:disabler, 3)
      nyx_assassin.add_role(:nuker, 3)

      slark = FactoryGirl.create(:hero, name: "Slark",
                                        attack_type: :melee,
                                        main_attribute: :agility,
                                        viable_solo: 1)

      slark.add_role(:escape, 3)
      slark.add_role(:ganker, 2)

      medusa = FactoryGirl.create(:hero, name: "Medusa",
                                         attack_type: :ranged,
                                         main_attribute: :agility,
                                         viable_solo: 3)

      medusa.add_role(:carry, 3)
      medusa.add_role(:disabler, 1)
      medusa.add_role(:initiator, 2)

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
                                       main_attribute: :intelligence,
                                       viable_solo: 3)

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
                                       main_attribute: :intelligence,
                                       viable_solo: 0)

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
                                       main_attribute: :intelligence,
                                       viable_solo: 1)

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
                                               main_attribute: :intelligence,
                                               viable_solo: 2)

      witch_doctor.add_role(:support, 3)
      witch_doctor.add_role(:disabler, 2)

      enigma = FactoryGirl.create(:hero, name: "Enigma",
                                         attack_type: :ranged,
                                         main_attribute: :intelligence,
                                         viable_solo: 0)

      enigma.add_role(:disabler, 2)
      enigma.add_role(:initiator, 2)
      enigma.add_role(:jungler, 2)
      enigma.add_role(:pusher, 2)

      necrolyte = FactoryGirl.create(:hero, name: "Necrolyte",
                                            attack_type: :ranged,
                                            main_attribute: :intelligence,
                                            viable_solo: 1)

      necrolyte.add_role(:support, 2)
      necrolyte.add_role(:durable, 2)
      necrolyte.add_role(:carry, 2)

      warlock = FactoryGirl.create(:hero, name: "Warlock",
                                          attack_type: :ranged,
                                          main_attribute: :intelligence,
                                          viable_solo: 0)

      warlock.add_role(:initiator, 3)
      warlock.add_role(:lane_support, 3)
      warlock.add_role(:disabler, 1)

      queen_of_pain = FactoryGirl.create(:hero, name: "Queen of Pain",
                                                attack_type: :ranged,
                                                main_attribute: :intelligence,
                                                viable_solo: 3)

      queen_of_pain.add_role(:nuker, 2)
      queen_of_pain.add_role(:escape, 2)
      queen_of_pain.add_role(:carry, 2)

      death_prophet = FactoryGirl.create(:hero, name: "Death Prophet",
                                                attack_type: :ranged,
                                                main_attribute: :intelligence,
                                                viable_solo: 2)

      death_prophet.add_role(:pusher, 3)
      death_prophet.add_role(:nuker, 2)
      death_prophet.add_role(:durable, 2)

      pugna = FactoryGirl.create(:hero, name: "Pugna",
                                        attack_type: :ranged,
                                        main_attribute: :intelligence,
                                        viable_solo: 2)

      pugna.add_role(:nuker, 2)
      pugna.add_role(:pusher, 2)
      pugna.add_role(:support, 2)

      dazzle = FactoryGirl.create(:hero, name: "Dazzle",
                                         attack_type: :ranged,
                                         main_attribute: :intelligence,
                                         viable_solo: 0)

      dazzle.add_role(:lane_support, 3)

      leshrac = FactoryGirl.create(:hero, name: "Leshrac",
                                          attack_type: :ranged,
                                          main_attribute: :intelligence,
                                          viable_solo: 0)

      leshrac.add_role(:nuker, 3)
      leshrac.add_role(:pusher, 3)
      leshrac.add_role(:disabler, 1)
      leshrac.add_role(:support, 1)

      dark_seer = FactoryGirl.create(:hero, name: "Dark Seer",
                                            attack_type: :melee,
                                            main_attribute: :intelligence,
                                            viable_solo: 2)

      dark_seer.add_role(:initiator, 3)
      dark_seer.add_role(:nuker, 1)
      dark_seer.add_role(:escape, 1)

      batrider = FactoryGirl.create(:hero, name: "Batrider",
                                           attack_type: :ranged,
                                           main_attribute: :intelligence,
                                           viable_solo: 3)

      batrider.add_role(:initiator, 3)
      batrider.add_role(:disabler, 2)
      batrider.add_role(:nuker, 2)
      batrider.add_role(:escape, 1)

      ancient_apparition = FactoryGirl.create(:hero, name: "Ancient Apparition",
                                                     attack_type: :ranged,
                                                     main_attribute: :intelligence,
                                                     viable_solo: 0)

      ancient_apparition.add_role(:support, 3)
      ancient_apparition.add_role(:disabler, 2)

      invoker = FactoryGirl.create(:hero, name: "Invoker",
                                          attack_type: :ranged,
                                          main_attribute: :intelligence,
                                          viable_solo: 3)

      invoker.add_role(:carry, 2)
      invoker.add_role(:nuker, 2)
      invoker.add_role(:initiator, 2)
      invoker.add_role(:escape, 2)

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
                                                    main_attribute: :intelligence,
                                                    viable_solo: 3)

      outworld_devourer.add_role(:carry, 3)

      shadow_demon = FactoryGirl.create(:hero, name: "Shadow Demon",
                                               attack_type: :ranged,
                                               main_attribute: :intelligence,
                                               viable_solo: 3)

      shadow_demon.add_role(:support, 3)
      shadow_demon.add_role(:disabler, 2)
      shadow_demon.add_role(:nuker, 1)

      visage = FactoryGirl.create(:hero, name: "Visage",
                                         attack_type: :ranged,
                                         main_attribute: :intelligence,
                                         viable_solo: 3)

      visage.add_role(:nuker, 3)
      visage.add_role(:durable, 2)
      visage.add_role(:disabler, 1)

      # ********** COUNTERS ************
      
      alchemist.add_weak_against(clinkz)
      alchemist.add_weak_against(beastmaster)
      alchemist.add_weak_against(dark_seer)
      alchemist.add_strong_against(broodmother)
      alchemist.add_strong_against(death_prophet)
      alchemist.add_strong_against(meepo)

      ancient_apparition.add_weak_against(venomancer)
      ancient_apparition.add_weak_against(dragon_knight)
      ancient_apparition.add_weak_against(anti_mage)
      ancient_apparition.add_weak_against(keeper_of_the_light)
      ancient_apparition.add_strong_against(chen)
      ancient_apparition.add_strong_against(morphling)
      ancient_apparition.add_strong_against(slark)

      anti_mage.add_weak_against(dark_seer)
      anti_mage.add_weak_against(faceless_void)
      anti_mage.add_weak_against(enigma)
      anti_mage.add_strong_against(skeleton_king)
      anti_mage.add_strong_against(storm_spirit)
      anti_mage.add_strong_against(sven)
      anti_mage.add_strong_against(death_prophet)
      anti_mage.add_strong_against(ancient_apparition)

      axe.add_weak_against(visage)
      axe.add_weak_against(lifestealer)
      axe.add_weak_against(necrolyte)
      axe.add_strong_against(earthshaker)
      axe.add_strong_against(broodmother)

      bane.add_weak_against(necrolyte)
      bane.add_weak_against(enchantress)
      bane.add_weak_against(lina)
      bane.add_weak_against(invoker)
      bane.add_strong_against(timbersaw)
      bane.add_strong_against(invoker)

      batrider.add_weak_against(disruptor)
      batrider.add_weak_against(death_prophet)
      batrider.add_weak_against(rubick)
      batrider.add_weak_against(puck)
      batrider.add_strong_against(sven)
      batrider.add_strong_against(night_stalker)
      batrider.add_strong_against(invoker)
      batrider.add_strong_against(magnus)

      beastmaster.add_weak_against(death_prophet)
      beastmaster.add_weak_against(lone_druid)
      beastmaster.add_weak_against(tiny)
      beastmaster.add_weak_against(slark)
      beastmaster.add_strong_against(queen_of_pain)
      beastmaster.add_strong_against(brewmaster)
      beastmaster.add_strong_against(slardar)
      beastmaster.add_strong_against(enigma)
      beastmaster.add_strong_against(alchemist)

      bloodseeker.add_weak_against(lone_druid)
      bloodseeker.add_weak_against(clinkz)
      bloodseeker.add_weak_against(spectre)
      bloodseeker.add_strong_against(pudge)

      bounty_hunter.add_weak_against(rubick)
      bounty_hunter.add_weak_against(slardar)
      bounty_hunter.add_weak_against(enchantress)
      bounty_hunter.add_strong_against(riki)
      bounty_hunter.add_strong_against(sand_king)

      brewmaster.add_weak_against(beastmaster)
      brewmaster.add_weak_against(rubick)
      brewmaster.add_weak_against(lion)
      brewmaster.add_strong_against(crystal_maiden)
      brewmaster.add_strong_against(dazzle)
      brewmaster.add_strong_against(sniper)

      broodmother.add_weak_against(sand_king)
      broodmother.add_weak_against(shadow_demon)
      broodmother.add_weak_against(alchemist)
      broodmother.add_weak_against(axe)
      broodmother.add_strong_against(ursa)
      broodmother.add_strong_against(sniper)

      centaur_warrunner.add_weak_against(venomancer)
      centaur_warrunner.add_weak_against(lifestealer)
      centaur_warrunner.add_weak_against(kunkka)
      centaur_warrunner.add_strong_against(pugna)
      centaur_warrunner.add_strong_against(shadow_shaman)
      centaur_warrunner.add_strong_against(puck)
      centaur_warrunner.add_strong_against(spectre)

      chaos_knight.add_weak_against(necrolyte)
      chaos_knight.add_weak_against(lifestealer)
      chaos_knight.add_weak_against(lone_druid)
      chaos_knight.add_strong_against(silencer)
      chaos_knight.add_strong_against(rubick)
      chaos_knight.add_strong_against(shadow_shaman)
      chaos_knight.add_strong_against(warlock)
      chaos_knight.add_strong_against(visage)

      chen.add_weak_against(ancient_apparition)
      chen.add_weak_against(doom)
      chen.add_weak_against(spirit_breaker)
      chen.add_strong_against(shadow_fiend)
      chen.add_strong_against(gyrocopter)
      chen.add_strong_against(windrunner)

      clinkz.add_weak_against(queen_of_pain)
      clinkz.add_weak_against(invoker)
      clinkz.add_weak_against(spirit_breaker)
      clinkz.add_strong_against(clockwerk)
      clinkz.add_strong_against(alchemist)
      clinkz.add_strong_against(gyrocopter)
      clinkz.add_strong_against(bloodseeker)
      clinkz.add_strong_against(luna)
      clinkz.add_strong_against(doom)

      clockwerk.add_weak_against(clinkz)
      clockwerk.add_weak_against(viper)
      clockwerk.add_weak_against(shadow_fiend)
      clockwerk.add_strong_against(keeper_of_the_light)
      clockwerk.add_strong_against(lich)
      clockwerk.add_strong_against(silencer)
      clockwerk.add_strong_against(crystal_maiden)
      clockwerk.add_strong_against(pudge)

      crystal_maiden.add_weak_against(brewmaster)
      crystal_maiden.add_weak_against(ogre_magi)
      crystal_maiden.add_weak_against(clockwerk)
      crystal_maiden.add_strong_against(weaver)
      crystal_maiden.add_strong_against(treant_protector)
      crystal_maiden.add_strong_against(vengeful_spirit)

      dark_seer.add_weak_against(lifestealer)
      dark_seer.add_weak_against(doom)
      dark_seer.add_weak_against(necrolyte)
      dark_seer.add_strong_against(anti_mage)
      dark_seer.add_strong_against(skeleton_king)
      dark_seer.add_strong_against(dragon_knight)
      dark_seer.add_strong_against(alchemist)
      dark_seer.add_strong_against(sven)

      dazzle.add_weak_against(viper)
      dazzle.add_weak_against(brewmaster)
      dazzle.add_weak_against(tidehunter)
      dazzle.add_strong_against(razor)
      dazzle.add_strong_against(pudge)
      dazzle.add_strong_against(juggernaut)

      death_prophet.add_weak_against(alchemist)
      death_prophet.add_weak_against(anti_mage)
      death_prophet.add_weak_against(invoker)
      death_prophet.add_strong_against(batrider)
      death_prophet.add_strong_against(beastmaster)
      death_prophet.add_strong_against(lion)

      disruptor.add_strong_against(batrider)
      disruptor.add_strong_against(natures_prophet)
      disruptor.add_strong_against(io)

      doom.add_weak_against(slardar)
      doom.add_weak_against(clinkz)
      doom.add_strong_against(dark_seer)
      doom.add_strong_against(slark)
      doom.add_strong_against(chen)
      doom.add_strong_against(puck)

      dragon_knight.add_weak_against(lifestealer)
      dragon_knight.add_weak_against(dark_seer)
      dragon_knight.add_weak_against(enigma)
      dragon_knight.add_strong_against(luna)
      dragon_knight.add_strong_against(ancient_apparition)
      dragon_knight.add_strong_against(lycanthrope)
      dragon_knight.add_strong_against(lone_druid)

      drow_ranger.add_weak_against(keeper_of_the_light)
      drow_ranger.add_weak_against(nyx_assassin)
      drow_ranger.add_weak_against(tidehunter)
      drow_ranger.add_strong_against(skeleton_king)
      drow_ranger.add_strong_against(treant_protector)
      drow_ranger.add_strong_against(tidehunter)
      drow_ranger.add_strong_against(silencer)
      drow_ranger.add_strong_against(weaver)
      drow_ranger.add_strong_against(shadow_demon)
      drow_ranger.add_strong_against(magnus)

      earthshaker.add_weak_against(axe)
      earthshaker.add_weak_against(zeus)
      earthshaker.add_weak_against(keeper_of_the_light)

      enchantress.add_weak_against(shadow_fiend)
      enchantress.add_weak_against(pudge)
      enchantress.add_weak_against(juggernaut)
      enchantress.add_strong_against(shadow_fiend)
      enchantress.add_strong_against(bane)
      enchantress.add_strong_against(bounty_hunter)
      enchantress.add_strong_against(lifestealer)

      enigma.add_weak_against(silencer)
      enigma.add_weak_against(rubick)
      enigma.add_weak_against(beastmaster)
      enigma.add_weak_against(puck)
      enigma.add_weak_against(vengeful_spirit)
      enigma.add_strong_against(sven)
      enigma.add_strong_against(anti_mage)
      enigma.add_strong_against(outworld_devourer)
      enigma.add_strong_against(naga_siren)
      enigma.add_strong_against(dragon_knight)
      enigma.add_strong_against(faceless_void)

      faceless_void.add_weak_against(omniknight)
      faceless_void.add_weak_against(invoker)
      faceless_void.add_weak_against(enigma)
      faceless_void.add_strong_against(magnus)
      faceless_void.add_strong_against(outworld_devourer)
      faceless_void.add_strong_against(anti_mage)
      faceless_void.add_strong_against(zeus)
      faceless_void.add_strong_against(lycanthrope)
      faceless_void.add_strong_against(puck)

      gyrocopter.add_weak_against(clinkz)
      gyrocopter.add_weak_against(puck)
      gyrocopter.add_weak_against(chen)
      gyrocopter.add_strong_against(templar_assassin)
      gyrocopter.add_strong_against(undying)

      necrolyte.add_weak_against(necrolyte)
      necrolyte.add_weak_against(undying)
      necrolyte.add_weak_against(windrunner)

      invoker.add_weak_against(outworld_devourer)
      invoker.add_weak_against(batrider)
      invoker.add_weak_against(templar_assassin)
      invoker.add_strong_against(faceless_void)
      invoker.add_strong_against(death_prophet)
      invoker.add_strong_against(clinkz)

      jakiro.add_weak_against(naga_siren)
      jakiro.add_weak_against(undying)
      jakiro.add_weak_against(lone_druid)
      jakiro.add_strong_against(leshrac)
      jakiro.add_strong_against(lone_druid)

      juggernaut.add_weak_against(skeleton_king)
      juggernaut.add_weak_against(dazzle)
      juggernaut.add_weak_against(luna)
      juggernaut.add_weak_against(shadow_shaman)
      juggernaut.add_strong_against(spectre)
      juggernaut.add_strong_against(rubick)
      juggernaut.add_strong_against(pugna)
      juggernaut.add_strong_against(sand_king)
      juggernaut.add_strong_against(enchantress)

      keeper_of_the_light.add_weak_against(clockwerk)
      keeper_of_the_light.add_weak_against(naga_siren)
      keeper_of_the_light.add_weak_against(luna)
      keeper_of_the_light.add_strong_against(drow_ranger)
      keeper_of_the_light.add_strong_against(ancient_apparition)
      keeper_of_the_light.add_strong_against(earthshaker)

      kunkka.add_weak_against(undying)
      kunkka.add_weak_against(windrunner)
      kunkka.add_weak_against(luna)
      kunkka.add_strong_against(tinker)
      kunkka.add_strong_against(venomancer)
      kunkka.add_strong_against(io)
      kunkka.add_strong_against(centaur_warrunner)
      kunkka.add_strong_against(viper)

      leshrac.add_weak_against(pugna)
      leshrac.add_weak_against(jakiro)
      leshrac.add_weak_against(undying)
      leshrac.add_strong_against(templar_assassin)
      leshrac.add_strong_against(tiny)

      lich.add_weak_against(clockwerk)
      lich.add_weak_against(tiny)
      lich.add_weak_against(pugna)
      lich.add_weak_against(shadow_shaman)

      lifestealer.add_weak_against(viper)
      lifestealer.add_weak_against(meepo)
      lifestealer.add_weak_against(pugna)
      lifestealer.add_weak_against(enchantress)
      lifestealer.add_strong_against(dark_seer)
      lifestealer.add_strong_against(dragon_knight)
      lifestealer.add_strong_against(chaos_knight)
      lifestealer.add_strong_against(centaur_warrunner)
      lifestealer.add_strong_against(axe)

      lina.add_weak_against(weaver)
      lina.add_weak_against(undying)
      lina.add_weak_against(pugna)
      lina.add_strong_against(bane)
      lina.add_strong_against(meepo)

      lion.add_weak_against(luna)
      lion.add_weak_against(death_prophet)
      lion.add_weak_against(undying)
      lion.add_weak_against(skeleton_king)
      lion.add_strong_against(mirana)
      lion.add_strong_against(brewmaster)
      lion.add_strong_against(phantom_assassin)
      lion.add_strong_against(morphling)
      lion.add_strong_against(queen_of_pain)

      lone_druid.add_weak_against(skeleton_king)
      lone_druid.add_weak_against(tidehunter)
      lone_druid.add_weak_against(phantom_lancer)
      lone_druid.add_weak_against(jakiro)
      lone_druid.add_weak_against(dragon_knight)
      lone_druid.add_strong_against(bloodseeker)
      lone_druid.add_strong_against(beastmaster)
      lone_druid.add_strong_against(lycanthrope)
      lone_druid.add_strong_against(mirana)
      lone_druid.add_strong_against(chaos_knight)
      lone_druid.add_strong_against(jakiro)

      luna.add_weak_against(dragon_knight)
      luna.add_weak_against(clinkz)
      luna.add_weak_against(visage)
      luna.add_strong_against(undying)
      luna.add_strong_against(lion)
      luna.add_strong_against(kunkka)
      luna.add_strong_against(keeper_of_the_light)
      luna.add_strong_against(juggernaut)

      lycanthrope.add_weak_against(lone_druid)
      lycanthrope.add_weak_against(dragon_knight)
      lycanthrope.add_weak_against(faceless_void)
      lycanthrope.add_strong_against(zeus)
      lycanthrope.add_strong_against(pudge)

      magnus.add_weak_against(faceless_void)
      magnus.add_weak_against(batrider)
      magnus.add_weak_against(drow_ranger)
      magnus.add_strong_against(weaver)
      magnus.add_strong_against(zeus)
      magnus.add_strong_against(windrunner)

      #medusa
      
      meepo.add_weak_against(undying)
      meepo.add_weak_against(lina)
      meepo.add_weak_against(alchemist)
      meepo.add_strong_against(mirana)
      meepo.add_strong_against(lifestealer)
      meepo.add_strong_against(natures_prophet)

      mirana.add_weak_against(lion)
      mirana.add_weak_against(visage)
      mirana.add_weak_against(zeus)
      mirana.add_weak_against(riki)
      mirana.add_weak_against(meepo)
      mirana.add_weak_against(lone_druid)
      mirana.add_weak_against(puck)
      mirana.add_strong_against(rubick)

      morphling.add_weak_against(ancient_apparition)
      morphling.add_weak_against(lion)
      morphling.add_weak_against(shadow_shaman)
      morphling.add_strong_against(io)
      morphling.add_strong_against(witch_doctor)

      naga_siren.add_weak_against(tinker)
      naga_siren.add_weak_against(enigma)
      naga_siren.add_strong_against(jakiro)
      naga_siren.add_strong_against(keeper_of_the_light)

      natures_prophet.add_weak_against(nyx_assassin)
      natures_prophet.add_weak_against(sand_king)
      natures_prophet.add_weak_against(riki)
      natures_prophet.add_weak_against(disruptor)
      natures_prophet.add_weak_against(meepo)
      natures_prophet.add_strong_against(sniper)
      natures_prophet.add_strong_against(pudge)
      natures_prophet.add_strong_against(shadow_fiend)

      necrolyte.add_weak_against(outworld_devourer)
      necrolyte.add_weak_against(visage)
      necrolyte.add_weak_against(pugna)
      necrolyte.add_strong_against(huskar)
      necrolyte.add_strong_against(chaos_knight)
      necrolyte.add_strong_against(bane)
      necrolyte.add_strong_against(dark_seer)
      necrolyte.add_strong_against(axe)

      night_stalker.add_weak_against(batrider)

      nyx_assassin.add_strong_against(outworld_devourer)
      nyx_assassin.add_strong_against(queen_of_pain)
      nyx_assassin.add_strong_against(natures_prophet)
      nyx_assassin.add_strong_against(drow_ranger)
      nyx_assassin.add_strong_against(zeus)

      ogre_magi.add_weak_against(pugna)
      ogre_magi.add_strong_against(crystal_maiden)

      omniknight.add_weak_against(riki)
      omniknight.add_weak_against(outworld_devourer)
      omniknight.add_strong_against(faceless_void)
      omniknight.add_strong_against(pudge)

      outworld_devourer.add_weak_against(nyx_assassin)
      outworld_devourer.add_weak_against(faceless_void)
      outworld_devourer.add_weak_against(enigma)
      outworld_devourer.add_strong_against(phantom_assassin)
      outworld_devourer.add_strong_against(timbersaw)
      outworld_devourer.add_strong_against(invoker)
      outworld_devourer.add_strong_against(necrolyte)
      outworld_devourer.add_strong_against(rubick)
      outworld_devourer.add_strong_against(shadow_demon)
      outworld_devourer.add_strong_against(omniknight)

      phantom_assassin.add_weak_against(outworld_devourer)
      phantom_assassin.add_weak_against(lion)
      phantom_assassin.add_strong_against(shadow_shaman)

      phantom_lancer.add_weak_against(storm_spirit)
      phantom_lancer.add_weak_against(sven)
      phantom_lancer.add_weak_against(slardar)
      phantom_lancer.add_weak_against(centaur_warrunner)
      phantom_lancer.add_strong_against(skeleton_king)
      phantom_lancer.add_strong_against(visage)
      phantom_lancer.add_strong_against(lone_druid)

      puck.add_weak_against(doom)
      puck.add_weak_against(centaur_warrunner)
      puck.add_weak_against(silencer)
      puck.add_weak_against(faceless_void)
      puck.add_strong_against(treant_protector)
      puck.add_strong_against(batrider)
      puck.add_strong_against(gyrocopter)
      puck.add_strong_against(enigma)
      puck.add_strong_against(vengeful_spirit)
      puck.add_strong_against(tiny)
      puck.add_strong_against(mirana)

      pudge.add_weak_against(storm_spirit)
      pudge.add_weak_against(queen_of_pain)
      pudge.add_weak_against(natures_prophet)
      pudge.add_weak_against(bloodseeker)
      pudge.add_weak_against(dazzle)
      pudge.add_weak_against(omniknight)
      pudge.add_weak_against(lycanthrope)
      pudge.add_weak_against(clockwerk)
      pudge.add_strong_against(sniper)
      pudge.add_strong_against(enchantress)
      pudge.add_strong_against(windrunner)

      pugna.add_weak_against(centaur_warrunner)
      pugna.add_weak_against(juggernaut)
      pugna.add_weak_against(silencer)
      pugna.add_strong_against(ogre_magi)
      pugna.add_strong_against(leshrac)
      pugna.add_strong_against(lich)
      pugna.add_strong_against(necrolyte)
      pugna.add_strong_against(visage)
      pugna.add_strong_against(lifestealer)
      pugna.add_strong_against(lina)

      queen_of_pain.add_weak_against(beastmaster)
      queen_of_pain.add_weak_against(nyx_assassin)
      queen_of_pain.add_weak_against(night_stalker)
      queen_of_pain.add_weak_against(templar_assassin)
      queen_of_pain.add_weak_against(lion)
      queen_of_pain.add_weak_against(shadow_shaman)
      queen_of_pain.add_strong_against(pudge)
      queen_of_pain.add_strong_against(clinkz)
      queen_of_pain.add_strong_against(tiny)
      queen_of_pain.add_strong_against(night_stalker)
      queen_of_pain.add_strong_against(windrunner)
      queen_of_pain.add_strong_against(witch_doctor)

      razor.add_weak_against(dazzle)
      razor.add_weak_against(vengeful_spirit)
      razor.add_weak_against(sniper)
      razor.add_strong_against(storm_spirit)

      riki.add_weak_against(bounty_hunter)
      riki.add_weak_against(slardar)
      riki.add_weak_against(spirit_breaker)
      riki.add_strong_against(mirana)
      riki.add_strong_against(omniknight)
      riki.add_strong_against(natures_prophet)

      rubick.add_weak_against(chaos_knight)
      rubick.add_weak_against(mirana)
      rubick.add_weak_against(juggernaut)
      rubick.add_weak_against(outworld_devourer)
      rubick.add_strong_against(tidehunter)
      rubick.add_strong_against(batrider)
      rubick.add_strong_against(brewmaster)
      rubick.add_strong_against(bounty_hunter)
      rubick.add_strong_against(enigma)

      sand_king.add_weak_against(silencer)
      sand_king.add_weak_against(slardar)
      sand_king.add_weak_against(juggernaut)
      sand_king.add_weak_against(bounty_hunter)
      sand_king.add_strong_against(broodmother)
      sand_king.add_strong_against(venomancer)
      sand_king.add_strong_against(natures_prophet)
      sand_king.add_strong_against(sniper)

      shadow_demon.add_weak_against(sniper)
      shadow_demon.add_weak_against(outworld_devourer)
      shadow_demon.add_weak_against(drow_ranger)
      shadow_demon.add_strong_against(broodmother)
      shadow_demon.add_strong_against(templar_assassin)
      shadow_demon.add_strong_against(ursa)
      shadow_demon.add_strong_against(sven)
      shadow_demon.add_strong_against(anti_mage)

      shadow_fiend.add_weak_against(enchantress)
      shadow_fiend.add_weak_against(templar_assassin)
      shadow_fiend.add_weak_against(chen)
      shadow_fiend.add_weak_against(natures_prophet)
      shadow_fiend.add_strong_against(enchantress)
      shadow_fiend.add_strong_against(clockwerk)
      shadow_fiend.add_strong_against(undying)

      shadow_shaman.add_weak_against(chaos_knight)
      shadow_shaman.add_weak_against(centaur_warrunner)
      shadow_shaman.add_weak_against(phantom_assassin)
      shadow_shaman.add_strong_against(juggernaut)
      shadow_shaman.add_strong_against(morphling)
      shadow_shaman.add_strong_against(queen_of_pain)
      shadow_shaman.add_strong_against(lich)

      silencer.add_weak_against(chaos_knight)
      silencer.add_weak_against(drow_ranger)
      silencer.add_weak_against(clockwerk)
      silencer.add_strong_against(tiny)
      silencer.add_strong_against(enigma)
      silencer.add_strong_against(sand_king)
      silencer.add_strong_against(warlock)
      silencer.add_strong_against(puck)
      silencer.add_strong_against(pugna)

      skeleton_king.add_weak_against(anti_mage)
      skeleton_king.add_weak_against(dark_seer)
      skeleton_king.add_weak_against(phantom_lancer)
      skeleton_king.add_weak_against(drow_ranger)
      skeleton_king.add_strong_against(juggernaut)
      skeleton_king.add_strong_against(lone_druid)
      skeleton_king.add_strong_against(lion)

      slardar.add_weak_against(beastmaster)
      slardar.add_weak_against(brewmaster)
      slardar.add_weak_against(sven)
      slardar.add_strong_against(doom)
      slardar.add_strong_against(riki)
      slardar.add_strong_against(sand_king)
      slardar.add_strong_against(bounty_hunter)
      slardar.add_strong_against(phantom_lancer)
      slardar.add_strong_against(slark)

      slark.add_weak_against(doom)
      slark.add_weak_against(ancient_apparition)
      slark.add_weak_against(slardar)
      slark.add_strong_against(witch_doctor)
      slark.add_strong_against(beastmaster)

      sniper.add_weak_against(pudge)
      sniper.add_weak_against(natures_prophet)
      sniper.add_weak_against(brewmaster)
      sniper.add_weak_against(sand_king)
      sniper.add_weak_against(broodmother)
      sniper.add_strong_against(shadow_demon)
      sniper.add_strong_against(warlock)
      sniper.add_strong_against(razor)

      spectre.add_weak_against(juggernaut)
      spectre.add_weak_against(sven)
      spectre.add_weak_against(centaur_warrunner)
      spectre.add_strong_against(vengeful_spirit)
      spectre.add_strong_against(viper)
      spectre.add_strong_against(bloodseeker)

      spirit_breaker.add_weak_against(zeus)
      spirit_breaker.add_weak_against(vengeful_spirit)
      spirit_breaker.add_weak_against(sven)
      spirit_breaker.add_strong_against(chen)
      spirit_breaker.add_strong_against(tinker)
      spirit_breaker.add_strong_against(clinkz)
      spirit_breaker.add_strong_against(riki)

      storm_spirit.add_weak_against(anti_mage)
      storm_spirit.add_weak_against(razor)
      storm_spirit.add_weak_against(templar_assassin)
      storm_spirit.add_strong_against(phantom_lancer)
      storm_spirit.add_strong_against(pudge)
      storm_spirit.add_strong_against(zeus)

      sven.add_weak_against(batrider)
      sven.add_weak_against(enigma)
      sven.add_weak_against(anti_mage)
      sven.add_weak_against(shadow_demon)
      sven.add_weak_against(dark_seer)
      sven.add_strong_against(spirit_breaker)
      sven.add_strong_against(phantom_lancer)
      sven.add_strong_against(undying)
      sven.add_strong_against(spectre)
      sven.add_strong_against(slardar)

      templar_assassin.add_weak_against(gyrocopter)
      templar_assassin.add_weak_against(leshrac)
      templar_assassin.add_weak_against(shadow_demon)
      templar_assassin.add_strong_against(shadow_fiend)
      templar_assassin.add_strong_against(queen_of_pain)
      templar_assassin.add_strong_against(invoker)
      templar_assassin.add_strong_against(storm_spirit)

      tidehunter.add_weak_against(rubick)
      tidehunter.add_weak_against(weaver)
      tidehunter.add_weak_against(drow_ranger)
      tidehunter.add_strong_against(lone_druid)
      tidehunter.add_strong_against(drow_ranger)
      tidehunter.add_strong_against(dazzle)

      timbersaw.add_weak_against(outworld_devourer)
      timbersaw.add_weak_against(tiny)
      timbersaw.add_weak_against(bane)

      tinker.add_weak_against(kunkka)
      tinker.add_weak_against(ursa)
      tinker.add_weak_against(spirit_breaker)
      tinker.add_strong_against(naga_siren)
      tinker.add_strong_against(venomancer)

      tiny.add_weak_against(silencer)
      tiny.add_weak_against(queen_of_pain)
      tiny.add_weak_against(puck)
      tiny.add_weak_against(leshrac)
      tiny.add_strong_against(timbersaw)
      tiny.add_strong_against(lich)
      tiny.add_strong_against(beastmaster)

      treant_protector.add_weak_against(puck)
      treant_protector.add_weak_against(drow_ranger)
      treant_protector.add_weak_against(crystal_maiden)

      undying.add_weak_against(luna)
      undying.add_weak_against(sven)
      undying.add_weak_against(gyrocopter)
      undying.add_weak_against(shadow_fiend)
      undying.add_strong_against(meepo)
      undying.add_strong_against(huskar)
      undying.add_strong_against(kunkka)
      undying.add_strong_against(leshrac)
      undying.add_strong_against(lion)
      undying.add_strong_against(jakiro)
      undying.add_strong_against(lina)

      ursa.add_weak_against(viper)
      ursa.add_weak_against(broodmother)
      ursa.add_weak_against(shadow_demon)
      ursa.add_strong_against(venomancer)
      ursa.add_strong_against(tinker)

      vengeful_spirit.add_weak_against(spectre)
      vengeful_spirit.add_weak_against(puck)
      vengeful_spirit.add_weak_against(crystal_maiden)
      vengeful_spirit.add_weak_against(spirit_breaker)
      vengeful_spirit.add_weak_against(razor)
      vengeful_spirit.add_weak_against(enigma)

      venomancer.add_weak_against(ursa)
      venomancer.add_weak_against(sand_king)
      venomancer.add_weak_against(kunkka)
      venomancer.add_weak_against(chaos_knight)
      venomancer.add_weak_against(tinker)
      venomancer.add_strong_against(centaur_warrunner)
      venomancer.add_strong_against(ancient_apparition)
      venomancer.add_strong_against(zeus)
      venomancer.add_strong_against(windrunner)

      viper.add_weak_against(weaver)
      viper.add_weak_against(spectre)
      viper.add_weak_against(kunkka)
      viper.add_strong_against(lifestealer)
      viper.add_strong_against(dazzle)
      viper.add_strong_against(ursa)
      viper.add_strong_against(clockwerk)

      visage.add_weak_against(phantom_lancer)
      visage.add_weak_against(chaos_knight)
      visage.add_weak_against(pugna)
      visage.add_weak_against(mirana)
      visage.add_weak_against(axe)
      visage.add_weak_against(necrolyte)
      visage.add_weak_against(luna)

      warlock.add_weak_against(sniper)
      warlock.add_weak_against(silencer)
      warlock.add_weak_against(chaos_knight)

      weaver.add_weak_against(crystal_maiden)
      weaver.add_weak_against(magnus)
      weaver.add_weak_against(drow_ranger)
      weaver.add_strong_against(viper)
      weaver.add_strong_against(tidehunter)
      weaver.add_strong_against(lina)

      windrunner.add_weak_against(venomancer)
      windrunner.add_weak_against(queen_of_pain)
      windrunner.add_weak_against(magnus)
      windrunner.add_weak_against(pudge)
      windrunner.add_weak_against(chen)
      windrunner.add_strong_against(huskar)
      windrunner.add_strong_against(kunkka)

      witch_doctor.add_weak_against(slark)
      witch_doctor.add_weak_against(queen_of_pain)
      witch_doctor.add_weak_against(morphling)

      zeus.add_weak_against(venomancer)
      zeus.add_weak_against(faceless_void)
      zeus.add_weak_against(lycanthrope)
      zeus.add_weak_against(storm_spirit)
      zeus.add_weak_against(magnus)
      zeus.add_weak_against(nyx_assassin)
      zeus.add_strong_against(mirana)
      zeus.add_strong_against(spirit_breaker)
      zeus.add_strong_against(earthshaker)
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
