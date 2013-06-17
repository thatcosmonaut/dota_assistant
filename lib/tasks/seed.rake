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
