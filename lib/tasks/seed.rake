namespace :db do
  desc 'Adds all hero related data to the database'
  task 'populate' => ['seed:roles', 'seed:heroes']

  namespace :seed do
    desc 'Adds heroes to the database'
    task 'heroes' => 'environment' do

      ###### RADIANT STRENGTH ######

      earthshaker = FactoryGirl.create(:hero, name: "Earthshaker",
                                              attack_type: :melee,
                                              team: :radiant,
                                              strength: 22,
                                              agility: 12,
                                              intelligence: 16,
                                              strength_increase: 2.5,
                                              agility_increase: 1.4,
                                              intelligence_increase: 1.8,
                                              armor: 2.68,
                                              movement_speed: 300,
                                              main_attribute: :strength,
                                              viable_mid: 0,
                                              viable_offlane: 0)

      earthshaker.builds.create(name: 'Initiator',
                                carry: 0,
                                disabler: 2,
                                durable: 2,
                                ganker: 1,
                                initiator: 3,
                                jungler: 0,
                                lane_support: 1,
                                nuker: 0,
                                pusher: 0,
                                support: 2)

      sven = FactoryGirl.create(:hero, name: "Sven",
                                       attack_type: :melee,
                                       team: :radiant,
                                       strength: 23,
                                       agility: 21,
                                       intelligence: 14,
                                       strength_increase: 2.7,
                                       agility_increase: 2,
                                       intelligence_increase: 1.3,
                                       armor: 1.94,
                                       movement_speed: 295,
                                       main_attribute: :strength,
                                       viable_mid: 0,
                                       viable_offlane: 0)

      sven.builds.create(name: 'Semi-Carry',
                         carry: 2,
                         disabler: 3,
                         durable: 0,
                         ganker: 0,
                         initiator: 2,
                         jungler: 0,
                         lane_support: 0,
                         nuker: 0,
                         pusher: 0,
                         support: 0)

      sven.builds.create(name: 'Support',
                         carry: 0,
                         disabler: 3,
                         durable: 0,
                         ganker: 0,
                         initiator: 2,
                         jungler: 0,
                         lane_support: 0,
                         nuker: 0,
                         pusher: 0,
                         support: 3)

      tiny = FactoryGirl.create(:hero, name: "Tiny",
                                       attack_type: :melee,
                                       team: :radiant,
                                       strength: 24,
                                       agility: 9,
                                       intelligence: 14,
                                       strength_increase: 3,
                                       agility_increase: 0.9,
                                       intelligence_increase: 1.6,
                                       armor: 0.26,
                                       movement_speed: 285,
                                       main_attribute: :strength,
                                       viable_mid: 2,
                                       viable_offlane: 0)

      tiny.builds.create(name: 'Nuker',
                         carry: 0,
                         disabler: 1,
                         durable: 1,
                         ganker: 3,
                         initiator: 1,
                         jungler: 0,
                         lane_support: 0,
                         nuker: 3,
                         pusher: 0,
                         support: 0)

      tiny.builds.create(name: 'Carry',
                         carry: 3,
                         disabler: 1,
                         durable: 3,
                         ganker: 1,
                         initiator: 1,
                         jungler: 0,
                         lane_support: 0,
                         nuker: 1,
                         pusher: 0,
                         support: 0)

      kunkka = FactoryGirl.create(:hero, name: "Kunkka",
                                         attack_type: :melee,
                                         team: :radiant,
                                         strength: 24,
                                         agility: 14,
                                         intelligence: 18,
                                         strength_increase: 3,
                                         agility_increase: 1.3,
                                         intelligence_increase: 1.5,
                                         armor: 1.96,
                                         movement_speed: 300,
                                         main_attribute: :strength,
                                         viable_mid: 2,
                                         viable_offlane: 0)

      kunkka.builds.create(name: 'Carry',
                           carry: 3,
                           disabler: 1,
                           durable: 1,
                           ganker: 0,
                           initiator: 0,
                           jungler: 0,
                           lane_support: 0,
                           nuker: 3,
                           pusher: 0,
                           support: 0)

      kunkka.builds.create(name: 'Initiator',
                           carry: 1,
                           disabler: 2,
                           durable: 1,
                           ganker: 0,
                           initiator: 3,
                           jungler: 0,
                           lane_support: 0,
                           nuker: 2,
                           pusher: 0,
                           support: 0)

      beastmaster = FactoryGirl.create(:hero, name: "Beastmaster",
                                              team: :radiant,
                                              attack_type: :melee,
                                              main_attribute: :strength,
                                              viable_mid: 2,
                                              viable_offlane: 0)

      beastmaster.builds.create(name: 'Support',
                                carry: 0,
                                disabler: 3,
                                durable: 1,
                                ganker: 0,
                                initiator: 3,
                                jungler: 0,
                                lane_support: 0,
                                nuker: 0,
                                pusher: 0,
                                support: 2)

      dragon_knight = FactoryGirl.create(:hero, name: "Dragon Knight",
                                                team: :radiant,
                                                attack_type: :melee,
                                                main_attribute: :strength,
                                                viable_mid: 2,
                                                viable_offlane: 0)

      dragon_knight.builds.create(name: 'Carry',
                                  carry: 3,
                                  disabler: 2,
                                  durable: 2,
                                  ganker: 0,
                                  initiator: 0,
                                  jungler: 0,
                                  lane_support: 0,
                                  nuker: 0,
                                  pusher: 1,
                                  support: 0)


      dragon_knight.builds.create(name: 'Pusher',
                                  carry: 1,
                                  disabler: 2,
                                  durable: 2,
                                  ganker: 0,
                                  initiator: 0,
                                  jungler: 0,
                                  lane_support: 0,
                                  nuker: 0,
                                  pusher: 3,
                                  support: 0)

      clockwerk = FactoryGirl.create(:hero, name: "Clockwerk",
                                            team: :radiant,
                                            attack_type: :melee,
                                            main_attribute: :strength,
                                            viable_mid: 3,
                                            viable_offlane: 0)

      clockwerk.builds.create(name: 'Ganker',
                              carry: 0,
                              disabler: 2,
                              durable: 2,
                              ganker: 3,
                              initiator: 0,
                              jungler: 0,
                              lane_support: 0,
                              nuker: 0,
                              pusher: 0,
                              support: 0)

      clockwerk.builds.create(name: 'Initiator',
                              carry: 0,
                              disabler: 2,
                              durable: 3,
                              ganker: 1,
                              initiator: 3,
                              jungler: 0,
                              lane_support: 0,
                              nuker: 0,
                              pusher: 0,
                              support: 0)

      omniknight = FactoryGirl.create(:hero, name: "Omniknight",
                                             team: :radiant,
                                             attack_type: :melee,
                                             main_attribute: :strength,
                                             viable_mid: 0,
                                             viable_offlane: 0)

      omniknight.builds.create(name: 'Support',
                               carry: 0,
                               disabler: 0,
                               durable: 2,
                               ganker: 0,
                               initiator: 0,
                               jungler: 0,
                               lane_support: 2,
                               nuker: 0,
                               pusher: 0,
                               support: 3)

      omniknight.builds.create(name: 'Semi-Carry',
                               carry: 2,
                               disabler: 0,
                               durable: 3,
                               ganker: 0,
                               initiator: 1,
                               jungler: 0,
                               lane_support: 0,
                               nuker: 0,
                               pusher: 0,
                               support: 0)

      huskar = FactoryGirl.create(:hero, name: "Huskar",
                                         team: :radiant,
                                         attack_type: :ranged,
                                         main_attribute: :strength,
                                         viable_mid: 1,
                                         viable_offlane: 0)


      huskar.builds.create(name: 'Carry',
                           carry: 3,
                           disabler: 0,
                           durable: 1,
                           ganker: 1,
                           initiator: 1,
                           jungler: 0,
                           lane_support: 0,
                           nuker: 0,
                           pusher: 0,
                           support: 0)

      huskar.builds.create(name: 'Ganker',
                           carry: 0,
                           disabler: 0,
                           durable: 1,
                           ganker: 3,
                           initiator: 1,
                           jungler: 0,
                           lane_support: 0,
                           nuker: 0,
                           pusher: 0,
                           support: 0)

      alchemist = FactoryGirl.create(:hero, name: "Alchemist",
                                            team: :radiant,
                                            attack_type: :melee,
                                            main_attribute: :strength,
                                            viable_mid: 0,
                                            viable_offlane: 0)

      alchemist.builds.create(name: 'Carry',
                              carry: 3,
                              disabler: 1,
                              durable: 2,
                              ganker: 0,
                              initiator: 1,
                              jungler: 0,
                              lane_support: 0,
                              nuker: 0,
                              pusher: 0,
                              support: 0)

      alchemist.builds.create(name: 'Support',
                              carry: 0,
                              disabler: 3,
                              durable: 2,
                              ganker: 0,
                              initiator: 2,
                              jungler: 0,
                              lane_support: 2,
                              nuker: 0,
                              pusher: 0,
                              support: 2)

      alchemist.builds.create(name: 'Jungler',
                              carry: 3,
                              disabler: 1,
                              durable: 2,
                              ganker: 0,
                              initiator: 1,
                              jungler: 3,
                              lane_support: 0,
                              nuker: 0,
                              pusher: 0,
                              support: 0)

      brewmaster = FactoryGirl.create(:hero, name: "Brewmaster",
                                             team: :radiant,
                                             attack_type: :melee,
                                             main_attribute: :strength,
                                             viable_mid: 1,
                                             viable_offlane: 0)

      brewmaster.builds.create(name: 'Carry',
                               carry: 3,
                               disabler: 0,
                               durable: 2,
                               ganker: 0,
                               initiator: 1,
                               jungler: 0,
                               lane_support: 0,
                               nuker: 0,
                               pusher: 0,
                               support: 0)

      brewmaster.builds.create(name: 'Ganker',
                               carry: 0,
                               disabler: 1,
                               durable: 2,
                               ganker: 3,
                               initiator: 1,
                               jungler: 0,
                               lane_support: 0,
                               nuker: 0,
                               pusher: 0,
                               support: 0)

      brewmaster.builds.create(name: 'Initiator',
                               carry: 0,
                               disabler: 1,
                               durable: 2,
                               ganker: 1,
                               initiator: 3,
                               jungler: 0,
                               lane_support: 0,
                               nuker: 0,
                               pusher: 0,
                               support: 0)

      treant_protector = FactoryGirl.create(:hero, name: "Treant Protector",
                                                   team: :radiant,
                                                   attack_type: :melee,
                                                   main_attribute: :strength,
                                                   viable_mid: 0,
                                                   viable_offlane: 0)

      treant_protector.builds.create(name: 'Support',
                                     carry: 0,
                                     disabler: 2,
                                     durable: 2,
                                     ganker: 0,
                                     initiator: 0,
                                     jungler: 0,
                                     lane_support: 2,
                                     nuker: 0,
                                     pusher: 0,
                                     support: 3)

      io = FactoryGirl.create(:hero, name: "Io",
                                     team: :radiant,
                                     attack_type: :ranged,
                                     main_attribute: :strength,
                                     viable_mid: 0,
                                     viable_offlane: 0)

      io.builds.create(name: 'Support',
                       carry: 0,
                       disabler: 0,
                       durable: 0,
                       ganker: 1,
                       initiator: 3,
                       jungler: 0,
                       lane_support: 2,
                       nuker: 2,
                       pusher: 0,
                       support: 3)

      centaur_warrunner = FactoryGirl.create(:hero, name: "Centaur Warrunner",
                                                    team: :radiant,
                                                    attack_type: :melee,
                                                    main_attribute: :strength,
                                                    viable_mid: 0,
                                                    viable_offlane: 0)

      centaur_warrunner.builds.create(name: 'Initiator',
                                      carry: 0,
                                      disabler: 2,
                                      durable: 2,
                                      ganker: 0,
                                      initiator: 3,
                                      jungler: 0,
                                      lane_support: 0,
                                      nuker: 1,
                                      pusher: 0,
                                      support: 0)

      timbersaw = FactoryGirl.create(:hero, name: "Timbersaw",
                                            team: :radiant,
                                            attack_type: :melee,
                                            main_attribute: :strength,
                                            viable_mid: 0,
                                            viable_offlane: 3)

      timbersaw.builds.create(name: 'Initiator',
                              carry: 0,
                              disabler: 1,
                              durable: 3,
                              ganker: 0,
                              initiator: 3,
                              jungler: 0,
                              lane_support: 0,
                              nuker: 0,
                              pusher: 0,
                              support: 0)

      bristleback = FactoryGirl.create(:hero, name: "Bristleback",
                                              team: :radiant,
                                              attack_type: :melee,
                                              main_attribute: :strength,
                                              viable_mid: 1,
                                              viable_offlane: 2)

      bristleback.builds.create(name: 'Ganker',
                                carry: 1,
                                disabler: 1,
                                durable: 3,
                                ganker: 3,
                                initiator: 0,
                                jungler: 0,
                                lane_support: 0,
                                nuker: 0,
                                pusher: 0,
                                support: 0)

      bristleback.builds.create(name: 'Carry',
                                carry: 3,
                                disabler: 1,
                                durable: 3,
                                ganker: 1,
                                initiator: 0,
                                jungler: 0,
                                lane_support: 0,
                                nuker: 0,
                                pusher: 0,
                                support: 0)

      tusk = FactoryGirl.create(:hero, name: "Tusk",
                                       team: :radiant,
                                       attack_type: :melee,
                                       main_attribute: :strength,
                                       viable_mid: 1,
                                       viable_offlane: 0)

      tusk.builds.create(name: 'Initiator',
                         carry: 0,
                         disabler: 1,
                         durable: 2,
                         ganker: 0,
                         initiator: 3,
                         jungler: 0,
                         lane_support: 0,
                         nuker: 0,
                         pusher: 0,
                         support: 0)

      elder_titan = FactoryGirl.create(:hero, name: "Elder Titan",
                                              team: :radiant,
                                              attack_type: :melee,
                                              main_attribute: :strength,
                                              viable_mid: 0,
                                              viable_offlane: 0)

      elder_titan.builds.create(name: 'Initiator',
                                carry: 0,
                                disabler: 2,
                                durable: 3,
                                ganker: 0,
                                initiator: 2,
                                jungler: 0,
                                lane_support: 0,
                                nuker: 0,
                                pusher: 0,
                                support: 0)

      earth_spirit = FactoryGirl.create(:hero, name: "Earth Spirit",
                                               team: :radiant,
                                               attack_type: :melee,
                                               main_attribute: :strength,
                                               viable_mid: 2,
                                               viable_offlane: 0)

      earth_spirit.builds.create(name: 'Ganker',
                                 carry: 0,
                                 disabler: 2,
                                 durable: 0,
                                 ganker: 3,
                                 initiator: 2,
                                 jungler: 0,
                                 lane_support: 0,
                                 nuker: 0,
                                 pusher: 0,
                                 support: 0)

      earth_spirit.builds.create(name: 'Support',
                                 carry: 0,
                                 disabler: 2,
                                 durable: 0,
                                 ganker: 0,
                                 initiator: 2,
                                 jungler: 0,
                                 lane_support: 1,
                                 nuker: 0,
                                 pusher: 0,
                                 support: 3)

      legion_commander = FactoryGirl.create(:hero, name: "Legion Commander",
                                                   team: :radiant,
                                                   attack_type: :melee,
                                                   main_attribute: :strength,
                                                   viable_mid: 0,
                                                   viable_offlane: 0)

      legion_commander.builds.create(name: 'Carry',
                                     carry: 3,
                                     disabler: 2,
                                     durable: 2,
                                     ganker: 0,
                                     initiator: 0,
                                     jungler: 0,
                                     lane_support: 0,
                                     nuker: 0,
                                     pusher: 0,
                                     support: 0)

      phoenix = FactoryGirl.create(:hero, name: "Phoenix",
                                          team: :radiant,
                                          attack_type: :ranged,
                                          main_attribute: :strength,
                                          viable_mid: 0,
                                          viable_offlane: 0)

      phoenix.builds.create(name: 'Support',
                            carry: 0,
                            disabler: 1,
                            durable: 1,
                            ganker: 0,
                            initiator: 1,
                            jungler: 0,
                            lane_support: 2,
                            nuker: 0,
                            pusher: 0,
                            support: 3)

      phoenix.builds.create(name: 'Initiator',
                            carry: 0,
                            disabler: 2,
                            durable: 1,
                            ganker: 0,
                            initiator: 3,
                            jungler: 0,
                            lane_support: 0,
                            nuker: 0,
                            pusher: 0,
                            support: 0)


      ###### RADIANT AGILITY ######

      anti_mage = FactoryGirl.create(:hero, name: "Anti-Mage",
                                            team: :radiant,
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
                                            viable_mid: 0,
                                            viable_offlane: 1)

      anti_mage.builds.create(name: 'Carry',
                              carry: 3,
                              disabler: 0,
                              durable: 0,
                              ganker: 2,
                              initiator: 0,
                              jungler: 0,
                              lane_support: 0,
                              nuker: 0,
                              pusher: 0,
                              support: 0)

      drow_ranger = FactoryGirl.create(:hero, name: "Drow Ranger",
                                              team: :radiant,
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
                                              viable_mid: 3,
                                              viable_offlane: 0)

      drow_ranger.builds.create(name: 'Carry',
                                carry: 3,
                                disabler: 1,
                                durable: 0,
                                ganker: 2,
                                initiator: 0,
                                jungler: 0,
                                lane_support: 0,
                                nuker: 0,
                                pusher: 0,
                                support: 0)

      drow_ranger.builds.create(name: 'Ganker',
                                carry: 1,
                                disabler: 1,
                                durable: 0,
                                ganker: 3,
                                initiator: 2,
                                jungler: 0,
                                lane_support: 0,
                                nuker: 0,
                                pusher: 0,
                                support: 0)

      juggernaut = FactoryGirl.create(:hero, name: "Juggernaut",
                                             team: :radiant,
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
                                             viable_mid: 1,
                                             viable_offlane: 0)

      juggernaut.builds.create(name: 'Carry',
                               carry: 3,
                               disabler: 0,
                               durable: 0,
                               ganker: 2,
                               initiator: 0,
                               jungler: 0,
                               lane_support: 0,
                               nuker: 0,
                               pusher: 0,
                               support: 0)

      juggernaut.builds.create(name: 'Pusher',
                               carry: 1,
                               disabler: 0,
                               durable: 0,
                               ganker: 1,
                               initiator: 0,
                               jungler: 0,
                               lane_support: 0,
                               nuker: 0,
                               pusher: 3,
                               support: 0)

      mirana = FactoryGirl.create(:hero, name: "Mirana",
                                         team: :radiant,
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
                                         viable_mid: 2,
                                         viable_offlane: 2)

      mirana.builds.create(name: 'Ganker',
                           carry: 0,
                           disabler: 2,
                           durable: 0,
                           ganker: 3,
                           initiator: 1,
                           jungler: 0,
                           lane_support: 0,
                           nuker: 0,
                           pusher: 0,
                           support: 0)

      mirana.builds.create(name: 'Semi-Carry',
                           carry: 2,
                           disabler: 2,
                           durable: 0,
                           ganker: 1,
                           initiator: 1,
                           jungler: 0,
                           lane_support: 0,
                           nuker: 0,
                           pusher: 0,
                           support: 0)

      mirana.builds.create(name: 'Initiator/Support',
                           carry: 0,
                           disabler: 2,
                           durable: 0,
                           ganker: 0,
                           initiator: 2,
                           jungler: 0,
                           lane_support: 0,
                           nuker: 0,
                           pusher: 0,
                           support: 2)

      morphling = FactoryGirl.create(:hero, name: "Morphling",
                                            team: :radiant,
                                            attack_type: :ranged,
                                            main_attribute: :agility,
                                            viable_mid: 0,
                                            viable_offlane: 1)

      morphling.builds.create(name: 'Carry',
                              carry: 3,
                              disabler: 0,
                              durable: 1,
                              ganker: 3,
                              initiator: 1,
                              jungler: 0,
                              lane_support: 0,
                              nuker: 0,
                              pusher: 0,
                              support: 0)

      phantom_lancer = FactoryGirl.create(:hero, name: "Phantom Lancer",
                                                 team: :radiant,
                                                 attack_type: :melee,
                                                 main_attribute: :agility,
                                                 viable_mid: 1,
                                                 viable_offlane: 1)

      phantom_lancer.builds.create(name: 'Carry',
                                   carry: 3,
                                   disabler: 0,
                                   durable: 0,
                                   ganker: 0,
                                   initiator: 0,
                                   jungler: 0,
                                   lane_support: 0,
                                   nuker: 0,
                                   pusher: 3,
                                   support: 0)

      vengeful_spirit = FactoryGirl.create(:hero, name: "Vengeful Spirit",
                                                  team: :radiant,
                                                  attack_type: :ranged,
                                                  main_attribute: :agility,
                                                  viable_mid: 2,
                                                  viable_offlane: 0)

      vengeful_spirit.builds.create(name: 'Support',
                                    carry: 0,
                                    disabler: 2,
                                    durable: 0,
                                    ganker: 0,
                                    initiator: 1,
                                    jungler: 0,
                                    lane_support: 2,
                                    nuker: 0,
                                    pusher: 0,
                                    support: 3)

      vengeful_spirit.builds.create(name: 'Ganker',
                                    carry: 0,
                                    disabler: 3,
                                    durable: 0,
                                    ganker: 3,
                                    initiator: 1,
                                    jungler: 0,
                                    lane_support: 0,
                                    nuker: 0,
                                    pusher: 0,
                                    support: 0)

      riki = FactoryGirl.create(:hero, name: "Riki",
                                       team: :radiant,
                                       attack_type: :melee,
                                       main_attribute: :agility,
                                       viable_mid: 1,
                                       viable_offlane: 0)


      riki.builds.create(name: 'Carry',
                         carry: 3,
                         disabler: 2,
                         durable: 0,
                         ganker: 1,
                         initiator: 1,
                         jungler: 0,
                         lane_support: 0,
                         nuker: 0,
                         pusher: 0,
                         support: 0)

      sniper = FactoryGirl.create(:hero, name: "Sniper",
                                         team: :radiant,
                                         attack_type: :ranged,
                                         main_attribute: :agility,
                                         viable_mid: 0,
                                         viable_offlane: 0)


      sniper.builds.create(name: 'Carry',
                           carry: 3,
                           disabler: 0,
                           durable: 0,
                           ganker: 3,
                           initiator: 0,
                           jungler: 0,
                           lane_support: 0,
                           nuker: 0,
                           pusher: 0,
                           support: 0)

      templar_assassin = FactoryGirl.create(:hero, name: "Templar Assassin",
                                                   team: :radiant,
                                                   attack_type: :ranged,
                                                   main_attribute: :agility,
                                                   viable_mid: 3,
                                                   viable_offlane: 0)


      templar_assassin.builds.create(name: 'Ganker',
                                     carry: 1,
                                     disabler: 1,
                                     durable: 1,
                                     ganker: 3,
                                     initiator: 0,
                                     jungler: 0,
                                     lane_support: 0,
                                     nuker: 0,
                                     pusher: 0,
                                     support: 0)

      luna = FactoryGirl.create(:hero, name: "Luna",
                                       team: :radiant,
                                       attack_type: :ranged,
                                       main_attribute: :agility,
                                       viable_mid: 2,
                                       viable_offlane: 1)

      luna.builds.create(name: 'Carry',
                         carry: 3,
                         disabler: 1,
                         durable: 0,
                         ganker: 0,
                         initiator: 0,
                         jungler: 0,
                         lane_support: 0,
                         nuker: 3,
                         pusher: 1,
                         support: 0)

      bounty_hunter = FactoryGirl.create(:hero, name: "Bounty Hunter",
                                                team: :radiant,
                                                attack_type: :melee,
                                                main_attribute: :agility,
                                                viable_mid: 1,
                                                viable_offlane: 1)

      bounty_hunter.builds.create(name: 'Ganker',
                                  carry: 1,
                                  disabler: 2,
                                  durable: 0,
                                  ganker: 3,
                                  initiator: 0,
                                  jungler: 0,
                                  lane_support: 0,
                                  nuker: 0,
                                  pusher: 0,
                                  support: 0)

      ursa = FactoryGirl.create(:hero, name: "Ursa",
                                       team: :radiant,
                                       attack_type: :melee,
                                       main_attribute: :agility,
                                       viable_mid: 0,
                                       viable_offlane: 0)

      ursa.builds.create(name: 'Carry',
                         carry: 3,
                         disabler: 0,
                         durable: 2,
                         ganker: 0,
                         initiator: 0,
                         jungler: 1,
                         lane_support: 0,
                         nuker: 0,
                         pusher: 0,
                         support: 0)

      gyrocopter = FactoryGirl.create(:hero, name: "Gyrocopter",
                                             team: :radiant,
                                             attack_type: :ranged,
                                             main_attribute: :agility,
                                             viable_mid: 3,
                                             viable_offlane: 0)

      gyrocopter.builds.create(name: 'Ganker',
                               carry: 0,
                               disabler: 0,
                               durable: 0,
                               ganker: 3,
                               initiator: 2,
                               jungler: 0,
                               lane_support: 0,
                               nuker: 1,
                               pusher: 0,
                               support: 0)

      gyrocopter.builds.create(name: 'Pusher',
                               carry: 0,
                               disabler: 0,
                               durable: 0,
                               ganker: 1,
                               initiator: 2,
                               jungler: 0,
                               lane_support: 0,
                               nuker: 1,
                               pusher: 3,
                               support: 0)

      lone_druid = FactoryGirl.create(:hero, name: "Lone Druid",
                                             team: :radiant,
                                             attack_type: :ranged,
                                             main_attribute: :agility,
                                             viable_mid: 1,
                                             viable_offlane: 3)

      lone_druid.builds.create(name: 'Carry',
                               carry: 3,
                               disabler: 1,
                               durable: 3,
                               ganker: 0,
                               initiator: 0,
                               jungler: 3,
                               lane_support: 0,
                               nuker: 0,
                               pusher: 0,
                               support: 0)

      lone_druid.builds.create(name: 'Pusher',
                               carry: 1,
                               disabler: 0,
                               durable: 3,
                               ganker: 0,
                               initiator: 0,
                               jungler: 3,
                               lane_support: 0,
                               nuker: 0,
                               pusher: 3,
                               support: 0)

      naga_siren = FactoryGirl.create(:hero, name: "Naga Siren",
                                             team: :radiant,
                                             attack_type: :melee,
                                             main_attribute: :agility,
                                             viable_mid: 3,
                                             viable_offlane: 0)

      naga_siren.builds.create(name: 'Carry',
                               carry: 3,
                               disabler: 1,
                               durable: 0,
                               ganker: 0,
                               initiator: 3,
                               jungler: 0,
                               lane_support: 0,
                               nuker: 0,
                               pusher: 1,
                               support: 0)

      naga_siren.builds.create(name: 'Support',
                               carry: 0,
                               disabler: 1,
                               durable: 0,
                               ganker: 0,
                               initiator: 3,
                               jungler: 0,
                               lane_support: 1,
                               nuker: 0,
                               pusher: 1,
                               support: 3)

      troll_warlord = FactoryGirl.create(:hero, name: "Troll Warlord",
                                                team: :radiant,
                                                attack_type: :ranged,
                                                main_attribute: :agility,
                                                viable_mid: 2,
                                                viable_offlane: 0)

      troll_warlord.builds.create(name: 'Carry',
                                  carry: 3,
                                  disabler: 0,
                                  durable: 0,
                                  ganker: 0,
                                  initiator: 0,
                                  jungler: 0,
                                  lane_support: 0,
                                  nuker: 0,
                                  pusher: 0,
                                  support: 0)

      ember_spirit = FactoryGirl.create(:hero, name: "Ember Spirit",
                                               team: :radiant,
                                               attack_type: :melee,
                                               main_attribute: :agility,
                                               viable_mid: 1,
                                               viable_offlane: 0)

      ember_spirit.builds.create(name: 'Carry',
                                 carry: 3,
                                 disabler: 1,
                                 durable: 1,
                                 ganker: 0,
                                 initiator: 0,
                                 jungler: 0,
                                 lane_support: 0,
                                 nuker: 2,
                                 pusher: 0,
                                 support: 0)

      #radiant intelligence
      crystal_maiden = FactoryGirl.create(:hero, name: "Crystal Maiden",
                                                 team: :radiant,
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
                                                 viable_mid: 0,
                                                 viable_offlane: 0)

      crystal_maiden.builds.create(name: 'Support',
                                   carry: 0,
                                   disabler: 3,
                                   durable: 0,
                                   ganker: 0,
                                   initiator: 0,
                                   jungler: 0,
                                   lane_support: 3,
                                   nuker: 0,
                                   pusher: 0,
                                   support: 3)

      puck = FactoryGirl.create(:hero, name: "Puck",
                                       team: :radiant,
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
                                       viable_mid: 3,
                                       viable_offlane: 0)

      puck.builds.create(name: 'Initiator',
                         carry: 0,
                         disabler: 1,
                         durable: 0,
                         ganker: 0,
                         initiator: 3,
                         jungler: 0,
                         lane_support: 0,
                         nuker: 2,
                         pusher: 0,
                         support: 0)

      puck.builds.create(name: 'Ganker',
                         carry: 0,
                         disabler: 1,
                         durable: 0,
                         ganker: 3,
                         initiator: 0,
                         jungler: 0,
                         lane_support: 0,
                         nuker: 2,
                         pusher: 0,
                         support: 0)

      storm_spirit = FactoryGirl.create(:hero, name: "Storm Spirit",
                                               team: :radiant,
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
                                               viable_mid: 3,
                                               viable_offlane: 0)

      storm_spirit.builds.create(name: 'Carry',
                                 carry: 3,
                                 disabler: 1,
                                 durable: 0,
                                 ganker: 3,
                                 initiator: 0,
                                 jungler: 0,
                                 lane_support: 0,
                                 nuker: 0,
                                 pusher: 0,
                                 support: 0)

      windranger = FactoryGirl.create(:hero, name: "Windranger",
                                             team: :radiant,
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
                                             viable_mid: 0,
                                             viable_offlane: 0)

      windranger.builds.create(name: 'Roamer',
                               carry: 0,
                               disabler: 2,
                               durable: 0,
                               ganker: 3,
                               initiator: 0,
                               jungler: 0,
                               lane_support: 0,
                               nuker: 1,
                               pusher: 0,
                               support: 0)

      windranger.builds.create(name: 'Support',
                               carry: 0,
                               disabler: 2,
                               durable: 0,
                               ganker: 0,
                               initiator: 1,
                               jungler: 0,
                               lane_support: 2,
                               nuker: 1,
                               pusher: 0,
                               support: 3)

      windranger.builds.create(name: 'Carry',
                               carry: 3,
                               disabler: 2,
                               durable: 0,
                               ganker: 0,
                               initiator: 1,
                               jungler: 0,
                               lane_support: 0,
                               nuker: 1,
                               pusher: 0,
                               support: 0)

      zeus = FactoryGirl.create(:hero, name: "Zeus",
                                       team: :radiant,
                                       attack_type: :ranged,
                                       main_attribute: :intelligence,
                                       viable_mid: 3,
                                       viable_offlane: 0)

      zeus.builds.create(name: 'Ganker',
                         carry: 0,
                         disabler: 0,
                         durable: 0,
                         ganker: 3,
                         initiator: 1,
                         jungler: 0,
                         lane_support: 0,
                         nuker: 3,
                         pusher: 0,
                         support: 0)

      lina = FactoryGirl.create(:hero, name: "Lina",
                                       team: :radiant,
                                       attack_type: :ranged,
                                       main_attribute: :intelligence,
                                       viable_mid: 2,
                                       viable_offlane: 1)

      lina.builds.create(name: 'Ganker',
                         carry: 0,
                         disabler: 1,
                         durable: 0,
                         ganker: 3,
                         initiator: 0,
                         jungler: 0,
                         lane_support: 0,
                         nuker: 3,
                         pusher: 0,
                         support: 0)

      lina.builds.create(name: 'Carry',
                         carry: 3,
                         disabler: 1,
                         durable: 0,
                         ganker: 1,
                         initiator: 2,
                         jungler: 0,
                         lane_support: 0,
                         nuker: 2,
                         pusher: 0,
                         support: 0)

      shadow_shaman = FactoryGirl.create(:hero, name: "Shadow Shaman",
                                                team: :radiant,
                                                attack_type: :ranged,
                                                main_attribute: :intelligence,
                                                viable_mid: 1,
                                                viable_offlane: 0)

      shadow_shaman.builds.create(name: 'Pusher',
                                  carry: 0,
                                  disabler: 1,
                                  durable: 0,
                                  ganker: 0,
                                  initiator: 0,
                                  jungler: 0,
                                  lane_support: 1,
                                  nuker: 0,
                                  pusher: 3,
                                  support: 2)

      shadow_shaman.builds.create(name: 'Disabler',
                                  carry: 0,
                                  disabler: 3,
                                  durable: 0,
                                  ganker: 0,
                                  initiator: 2,
                                  jungler: 0,
                                  lane_support: 1,
                                  nuker: 0,
                                  pusher: 1,
                                  support: 2)

      enchantress = FactoryGirl.create(:hero, name: "Enchantress",
                                              team: :radiant,
                                              attack_type: :ranged,
                                              main_attribute: :intelligence,
                                              viable_mid: 0,
                                              viable_offlane: 2)

      enchantress.builds.create(name: 'Carry',
                                carry: 3,
                                disabler: 1,
                                durable: 2,
                                ganker: 0,
                                initiator: 0,
                                jungler: 2,
                                lane_support: 0,
                                nuker: 0,
                                pusher: 0,
                                support: 0)

      enchanterss.builds.create(name: 'Pusher',
                                carry: 0,
                                disabler: 1,
                                durable: 2,
                                ganker: 0,
                                initiator: 0,
                                jungler: 0,
                                lane_support: 1,
                                nuker: 0,
                                pusher: 3,
                                support: 1)

      natures_prophet = FactoryGirl.create(:hero, name: "Nature's Prophet",
                                                  team: :radiant,
                                                  attack_type: :ranged,
                                                  main_attribute: :intelligence,
                                                  viable_mid: 0,
                                                  viable_offlane: 1)

      natures_prophet.builds.create(name: 'Ganker',
                                    carry: 1,
                                    disabler: 0,
                                    durable: 0,
                                    ganker: 3,
                                    initiator: 0,
                                    jungler: 3,
                                    lane_support: 0,
                                    nuker: 0,
                                    pusher: 0,
                                    support: 0)

      natures_prophet.builds.create(name: 'Pusher',
                                    carry: 1,
                                    disabler: 0,
                                    durable: 0,
                                    ganker: 1,
                                    initiator: 0,
                                    jungler: 3,
                                    lane_support: 0,
                                    nuker: 0,
                                    pusher: 3,
                                    support: 0)

      natures_prophet.builds.create(name: 'Carry',
                                    carry: 3,
                                    disabler: 0,
                                    durable: 0,
                                    ganker: 1,
                                    initiator: 0,
                                    jungler: 3,
                                    lane_support: 0,
                                    nuker: 0,
                                    pusher: 0,
                                    support; 0)

      tinker = FactoryGirl.create(:hero, name: "Tinker",
                                         team: :radiant,
                                         attack_type: :ranged,
                                         main_attribute: :intelligence,
                                         viable_mid: 1,
                                         viable_offlane: 1)

      tinker.builds.create(name: 'Pusher',
                           carry: 0,
                           disabler: 1,
                           durable: 0,
                           ganker: 0,
                           initiator: 0,
                           jungler: 0,
                           lane_support: 0,
                           nuker: 2,
                           pusher: 3,
                           support: 0)

      tinker.builds.create(name: 'Ganker',
                           carry: 0,
                           disabler: 2,
                           durable: 0,
                           ganker: 3,
                           initiator: 0,
                           jungler: 0,
                           lane_support: 0,
                           nuker: 2,
                           pusher: 1,
                           support: 0)

      jakiro = FactoryGirl.create(:hero, name: "Jakiro",
                                         team: :radiant,
                                         attack_type: :ranged,
                                         main_attribute: :intelligence,
                                         viable_mid: 0,
                                         viable_offlane: 0)

      jakiro.builds.create(name: 'Support',
                           carry: 0,
                           disabler: 2,
                           durable: 0,
                           ganker: 0,
                           initiator: 2,
                           jungler: 0,
                           lane_support: 1,
                           nuker: 2,
                           pusher: 1,
                           support: 3)

      chen = FactoryGirl.create(:hero, name: "Chen",
                                       team: :radiant,
                                       attack_type: :ranged,
                                       main_attribute: :intelligence,
                                       viable_mid: 0,
                                       viable_offlane: 0)

      chen.builds.create(name: 'Support',
                         carry: 0,
                         disabler: 0,
                         durable: 0,
                         ganker: 0,
                         initiator: 0,
                         jungler: 3,
                         lane_support: 0,
                         nuker: 0,
                         pusher: 3,
                         support: 3)

      silencer = FactoryGirl.create(:hero, name: "Silencer",
                                           team: :radiant,
                                           attack_type: :ranged,
                                           main_attribute: :intelligence,
                                           viable_mid: 1,
                                           viable_offlane: 2)

      silencer.builds.create(name: 'Carry',
                             carry: 3,
                             disabler: 2,
                             durable: 0,
                             ganker: 0,
                             initiator: 2,
                             jungler: 0,
                             lane_support: 0,
                             nuker: 0,
                             pusher: 0,
                             support: 0)

      silencer.builds.create(name: 'Support',
                             carry: 0,
                             disabler: 2,
                             durable: 0,
                             ganker: 0,
                             initiator: 2,
                             jungler: 0,
                             lane_support: 2,
                             nuker: 0,
                             pusher: 0,
                             support: 2)

      ogre_magi = FactoryGirl.create(:hero, name: "Ogre Magi",
                                            team: :radiant,
                                            attack_type: :melee,
                                            main_attribute: :intelligence,
                                            viable_mid: 0,
                                            viable_offlane: 0)

      ogre_magi.builds.create(name: 'Ganker',
                              carry: 0,
                              disabler: 3,
                              durable: 2,
                              ganker: 3,
                              initiator: 0,
                              jungler: 0,
                              lane_support: 0,
                              nuker: 0,
                              pusher: 0,
                              support: 0)

      rubick = FactoryGirl.create(:hero, name: "Rubick",
                                         team: :radiant,
                                         attack_type: :ranged,
                                         main_attribute: :intelligence,
                                         viable_mid: 1,
                                         viable_offlane: 0)

      rubick.builds.create(name: 'Support',
                           carry: 0,
                           disabler: 3,
                           durable: 0,
                           ganker: 0,
                           initiator: 0,
                           jungler: 0,
                           lane_support: 2,
                           nuker: 0,
                           pusher: 1,
                           support: 2)

      disruptor = FactoryGirl.create(:hero, name: "Disruptor",
                                            team: :radiant,
                                            attack_type: :ranged,
                                            main_attribute: :intelligence,
                                            viable_mid: 0,
                                            viable_offlane: 0)

      disruptor.builds.create(name: 'Initiator/Support',
                              carry: 0,
                              disabler: 1,
                              durable: 0,
                              ganker: 0,
                              initiator: 3,
                              jungler: 0,
                              lane_support: 1,
                              nuker: 2,
                              pusher: 0,
                              support: 2)

      keeper_of_the_light = FactoryGirl.create(:hero, name: "Keeper of the Light",
                                                      team: :radiant,
                                                      attack_type: :ranged,
                                                      main_attribute: :intelligence,
                                                      viable_mid: 0,
                                                      viable_offlane: 2)

      keeper_of_the_light.builds.create(name: 'Support',
                                        carry: 0,
                                        disabler: 0,
                                        durable: 0,
                                        ganker: 0,
                                        initiator: 0,
                                        jungler: 0,
                                        lane_support: 3,
                                        nuker: 0,
                                        pusher: 3,
                                        support: 3)

      skywrath_mage = FactoryGirl.create(:hero, name: "Skywrath Mage",
                                                team: :radiant,
                                                attack_type: :ranged,
                                                main_attribute: :intelligence,
                                                viable_mid: 3,
                                                viable_offlane: 0)

      skywrath_mage.builds.create(name: 'Support',
                                  carry: 0,
                                  disabler: 2,
                                  durable: 0,
                                  ganker: 0,
                                  initiator: 0,
                                  jungler: 0,
                                  lane_support: 2,
                                  nuker: 0,
                                  pusher: 0,
                                  support: 3)

      skywrath_mage.builds.create(name: 'Ganker',
                                  carry: 0,
                                  disabler: 0,
                                  durable: 0,
                                  ganker: 3,
                                  initiator: 1,
                                  jungler: 0,
                                  lane_support: 0,
                                  nuker: 3,
                                  pusher: 0,
                                  support: 0)

      #dire strength
      axe = FactoryGirl.create(:hero, name: "Axe",
                                      team: :dire,
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
                                      viable_mid: 0,
                                      viable_offlane: 1)

      axe.builds.create(name: 'Initiator',
                        carry: 0,
                        disabler: 1,
                        durable: 3,
                        ganker: 0,
                        initiator: 3,
                        jungler: 0,
                        lane_support: 1,
                        nuker: 0,
                        pusher: 0,
                        support: 0)

      pudge = FactoryGirl.create(:hero, name: "Pudge",
                                        team: :dire,
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
                                        viable_mid: 3,
                                        viable_offlane: 0)

      pudge.builds.create(name: 'Ganker',
                          carry: 0,
                          disabler: 2,
                          durable: 2,
                          ganker: 3,
                          initiator: 0,
                          jungler: 0,
                          lane_support: 0,
                          nuker: 0,
                          pusher: 0,
                          support: 0)

      sand_king = FactoryGirl.create(:hero, name: "Sand King",
                                            team: :dire,
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
                                            viable_mid: 0,
                                            viable_offlane: 0)

      sand_king.builds.create(name: 'Initiator',
                              carry: 0,
                              disabler: 2,
                              durable: 0,
                              ganker: 2,
                              initiator: 3,
                              jungler: 0,
                              lane_support: 0,
                              nuker: 0,
                              pusher: 0,
                              support: 0)

      sand_king.builds.create(name: 'Support',
                              carry: 0,
                              disabler: 2,
                              durable: 0,
                              ganker: 0,
                              initiator: 3,
                              jungler: 0,
                              lane_support: 1,
                              nuker: 0,
                              pusher: 0,
                              support: 3)

      sand_king.builds.create(name: 'Pusher',
                              carry: 0,
                              disabler: 2,
                              durable: 0,
                              ganker: 0,
                              initiator: 3,
                              jungler: 0,
                              lane_support: 0,
                              nuker: 0,
                              pusher: 3,
                              support: 0)

      slardar = FactoryGirl.create(:hero, name: "Slardar",
                                          team: :dire,
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
                                          viable_mid: 0,
                                          viable_offlane: 0)

      slardar.builds.create(name: 'Initiator',
                            carry: 1,
                            disabler: 2,
                            durable: 2,
                            ganker: 0,
                            initiator: 3,
                            jungler: 0,
                            lane_support: 0,
                            nuker: 0,
                            pusher: 0,
                            support: 0)

      slardar.builds.create(name: 'Carry',
                            carry: 3,
                            disabler: 2,
                            durable: 2,
                            ganker: 0,
                            initiator: 0,
                            jungler: 0,
                            lane_support: 0,
                            nuker: 0,
                            pusher: 0,
                            support: 0)

      tidehunter = FactoryGirl.create(:hero, name: "Tidehunter",
                                             team: :dire,
                                             attack_type: :melee,
                                             main_attribute: :strength,
                                             viable_mid: 0,
                                             viable_offlane: 0)

      tidehunter.builds.create(name: 'Support',
                               carry: 0,
                               disabler: 3,
                               durable: 2,
                               ganker: 0,
                               initiator: 3,
                               jungler: 0,
                               lane_support: 0,
                               nuker: 0,
                               pusher: 0,
                               support: 0)

      wraith_king = FactoryGirl.create(:hero, name: "Wraith King",
                                                team: :dire,
                                                attack_type: :melee,
                                                main_attribute: :strength,
                                                viable_mid: 0,
                                                viable_offlane: 0)

      wraith_king.builds.create(name: 'Carry',
                                carry: 3,
                                disabler: 2,
                                durable: 3,
                                ganker: 0,
                                initiator: 0,
                                jungler: 0,
                                lane_support: 0,
                                nuker: 0,
                                pusher: 0,
                                support: 0)

      lifestealer = FactoryGirl.create(:hero, name: "Lifestealer",
                                              team: :dire,
                                              attack_type: :melee,
                                              main_attribute: :strength,
                                              viable_mid: 0,
                                              viable_offlane: 0)

      lifestealer.builds.create(name: 'Carry',
                                carry: 3,
                                disabler: 0,
                                durable: 3,
                                ganker: 0,
                                initiator: 0,
                                jungler: 2,
                                lane_support: 0,
                                nuker: 0,
                                pusher: 0,
                                support: 0)

      night_stalker = FactoryGirl.create(:hero, name: "Night Stalker",
                                                team: :dire,
                                                attack_type: :melee,
                                                main_attribute: :strength,
                                                viable_mid: 3,
                                                viable_offlane: 0)

      night_stalker.builds.create(name: 'Ganker',
                                  carry: 0,
                                  disabler: 2,
                                  durable: 2,
                                  ganker: 3,
                                  initiator: 0,
                                  jungler: 0,
                                  lane_support: 0,
                                  nuker: 0,
                                  pusher: 0,
                                  support: 0)

      doom = FactoryGirl.create(:hero, name: "Doom",
                                       team: :dire,
                                       attack_type: :melee,
                                       main_attribute: :strength,
                                       viable_mid: 0,
                                       viable_offlane: 0)

      doom.builds.create(name: 'Carry',
                         carry: 3,
                         disabler: 3,
                         durable: 2,
                         ganker: 0,
                         initiator: 1,
                         jungler: 2,
                         lane_support: 0,
                         nuker: 0,
                         pusher: 0,
                         support: 0)

      spirit_breaker = FactoryGirl.create(:hero, name: "Spirit Breaker",
                                                 team: :dire,
                                                 attack_type: :melee,
                                                 main_attribute: :strength,
                                                 viable_mid: 0,
                                                 viable_offlane: 0)

      spirit_breaker.builds.create(name: 'Ganker',
                                   carry: 2,
                                   disabler: 0,
                                   durable: 1,
                                   ganker: 3,
                                   initiator: 1,
                                   jungler: 0,
                                   lane_support: 0,
                                   nuker: 0,
                                   pusher: 0,
                                   support: 0)

      lycanthrope = FactoryGirl.create(:hero, name: "Lycanthrope",
                                              team: :dire,
                                              attack_type: :melee,
                                              main_attribute: :strength,
                                              viable_mid: 0,
                                              viable_offlane: 0)

      lycanthrope.builds.create(name: 'Carry',
                                carry: 3,
                                disabler: 0,
                                durable: 2,
                                ganker: 0,
                                initiator: 0,
                                jungler: 2,
                                lane_support: 0,
                                nuker: 0,
                                pusher: 0,
                                support: 0)

      lycanthrope.builds.create(name: 'Pusher',
                                carry: 1,
                                disabler: 0,
                                durable: 2,
                                ganker: 0,
                                initiator: 0,
                                jungler: 2,
                                lane_support: 0,
                                nuker: 0,
                                pusher: 3,
                                support: 0)

      chaos_knight = FactoryGirl.create(:hero, name: "Chaos Knight",
                                               team: :dire,
                                               attack_type: :melee,
                                               main_attribute: :strength,
                                               viable_mid: 0,
                                               viable_offlane: 0)

      chaos_knight.builds.create(name: 'Carry',
                                 carry: 3,
                                 disabler: 2,
                                 durable: 2,
                                 ganker: 0,
                                 initiator: 1,
                                 jungler: 0,
                                 lane_support: 0,
                                 nuker: 0,
                                 pusher: 0,
                                 support: 0)

      undying = FactoryGirl.create(:hero, name: "Undying",
                                          team: :dire,
                                          attack_type: :melee,
                                          main_attribute: :strength,
                                          viable_mid: 1,
                                          viable_offlane: 0)

      undying.builds.create(name: 'Initiator',
                            carry: 0,
                            disabler: 0,
                            durable: 3,
                            ganker: 0,
                            initiator: 3,
                            jungler: 0,
                            lane_support: 0,
                            nuker: 0,
                            pusher: 2,
                            support: 0)

      magnus = FactoryGirl.create(:hero, name: "Magnus",
                                         team: :dire,
                                         attack_type: :melee,
                                         main_attribute: :strength,
                                         viable_mid: 3,
                                         viable_offlane: 0)

      magnus.builds.create(name: 'Initiator',
                           carry: 1,
                           disabler: 2,
                           durable: 0,
                           ganker: 0,
                           initiator: 3,
                           jungler: 0,
                           lane_support: 0,
                           nuker: 2,
                           pusher: 0,
                           support: 0)

      abaddon = FactoryGirl.create(:hero, name: "Abaddon",
                                          team: :dire,
                                          attack_type: :melee,
                                          main_attribute: :strength,
                                          viable_mid: 1,
                                          viable_offlane: 0)

      abaddon.builds.create(name: 'Support',
                            carry: 0,
                            disabler: 0,
                            durable: 3,
                            ganker: 0,
                            initiator: 0,
                            jungler: 0,
                            lane_support: 2,
                            nuker: 1,
                            pusher: 0,
                            support: 2)

      abaddon.builds.create(name: 'Carry',
                            carry: 3,
                            disabler: 0,
                            durable: 3,
                            ganker: 0,
                            initiator: 1,
                            jungler: 0,
                            lane_support: 0,
                            nuker: 1,
                            pusher: 0,
                            support: 0)

      #dire agility
      bloodseeker = FactoryGirl.create(:hero, name: "Bloodseeker",
                                              team: :dire,
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
                                              viable_mid: 1,
                                              viable_offlane: 0)

      bloodseeker.add_role(:carry, 3)
      bloodseeker.add_role(:jungler, 2)

      shadow_fiend = FactoryGirl.create(:hero, name: "Shadow Fiend",
                                               team: :dire,
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
                                               viable_mid: 3,
                                               viable_offlane: 0)

      shadow_fiend.add_role(:carry, 3)
      shadow_fiend.add_role(:nuker, 3)

      razor = FactoryGirl.create(:hero, name: "Razor",
                                        team: :dire,
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
                                        viable_mid: 2,
                                        viable_offlane: 0)

      razor.add_role(:carry, 2)
      razor.add_role(:durable, 2)
      razor.add_role(:nuker, 2)

      venomancer = FactoryGirl.create(:hero, name: "Venomancer",
                                             team: :dire,
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
                                             viable_mid: 0,
                                             viable_offlane: 0)

      venomancer.add_role(:support, 3)
      venomancer.add_role(:nuker, 1)
      venomancer.add_role(:initiator, 1)
      venomancer.add_role(:pusher, 2)

      faceless_void = FactoryGirl.create(:hero, name: "Faceless Void",
                                                team: :dire,
                                                attack_type: :melee,
                                                main_attribute: :agility,
                                                viable_mid: 0,
                                                viable_offlane: 0)

      faceless_void.add_role(:carry, 3)
      faceless_void.add_role(:initiator, 2)
      faceless_void.add_role(:disabler, 2)

      phantom_assassin = FactoryGirl.create(:hero, name: "Phantom Assassin",
                                                   team: :dire,
                                                   attack_type: :melee,
                                                   main_attribute: :agility,
                                                   viable_mid: 1,
                                                   viable_offlane: 1)

      phantom_assassin.add_role(:carry, 3)

      viper = FactoryGirl.create(:hero, name: "Viper",
                                        team: :dire,
                                        attack_type: :ranged,
                                        main_attribute: :agility,
                                        viable_mid: 3,
                                        viable_offlane: 0)

      viper.add_role(:carry, 2)
      viper.add_role(:durable, 2)
      viper.add_role(:ganker, 2)

      clinkz = FactoryGirl.create(:hero, name: "Clinkz",
                                         team: :dire,
                                         attack_type: :ranged,
                                         main_attribute: :agility,
                                         viable_mid: 0,
                                         viable_offlane: 2)

      clinkz.add_role(:carry, 3)

      broodmother = FactoryGirl.create(:hero, name: "Broodmother",
                                              team: :dire,
                                              attack_type: :melee,
                                              main_attribute: :agility,
                                              viable_mid: 1,
                                              viable_offlane: 2)

      broodmother.add_role(:pusher, 3)
      broodmother.add_role(:carry, 2)

      weaver = FactoryGirl.create(:hero, name: "Weaver",
                                         team: :dire,
                                         attack_type: :ranged,
                                         main_attribute: :agility,
                                         viable_mid: 1,
                                         viable_offlane: 3)

      weaver.add_role(:carry, 3)

      spectre = FactoryGirl.create(:hero, name: "Spectre",
                                          team: :dire,
                                          attack_type: :melee,
                                          main_attribute: :agility,
                                          viable_mid: 0,
                                          viable_offlane: 0)

      spectre.add_role(:carry, 3)
      spectre.add_role(:durable, 2)

      meepo = FactoryGirl.create(:hero, name: "Meepo",
                                        team: :dire,
                                        attack_type: :melee,
                                        main_attribute: :agility,
                                        viable_mid: 0,
                                        viable_offlane: 0)

      meepo.add_role(:carry, 3)
      meepo.add_role(:disabler, 2)
      meepo.add_role(:pusher, 2)

      nyx_assassin = FactoryGirl.create(:hero, name: "Nyx Assassin",
                                               team: :dire,
                                               attack_type: :melee,
                                               main_attribute: :agility,
                                               viable_mid: 3,
                                               viable_offlane: 0)

      nyx_assassin.add_role(:disabler, 3)
      nyx_assassin.add_role(:nuker, 3)

      slark = FactoryGirl.create(:hero, name: "Slark",
                                        team: :dire,
                                        attack_type: :melee,
                                        main_attribute: :agility,
                                        viable_mid: 2,
                                        viable_offlane: 0)

      slark.add_role(:ganker, 2)

      medusa = FactoryGirl.create(:hero, name: "Medusa",
                                         team: :dire,
                                         attack_type: :ranged,
                                         main_attribute: :agility,
                                         viable_mid: 3,
                                         viable_offlane: 1)

      medusa.add_role(:carry, 3)
      medusa.add_role(:disabler, 1)
      medusa.add_role(:initiator, 2)

      terrorblade = FactoryGirl.create(:hero, name: "Terrorblade",
                                              team: :dire,
                                              attack_type: :ranged,
                                              main_attribute: :agility,
                                              viable_mid: 0,
                                              viable_offlane: 0)

      terrorblade.add_role(:carry, 3)
      terrorblade.add_role(:pusher, 2)
      terrorblade.add_role(:jungler, 2)

      #dire intelligence
      bane = FactoryGirl.create(:hero, name: "Bane",
                                       team: :dire,
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
                                       viable_mid: 2,
                                       viable_offlane: 0)

      bane.add_role(:disabler, 3)
      bane.add_role(:nuker, 2)
      bane.add_role(:support, 1)

      lich = FactoryGirl.create(:hero, name: "Lich",
                                       team: :dire,
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
                                       viable_mid: 0,
                                       viable_offlane: 0)

      lich.add_role(:support, 2)
      lich.add_role(:lane_support, 3)
      lich.add_role(:nuker, 1)

      lion = FactoryGirl.create(:hero, name: "Lion",
                                       team: :dire,
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
                                       viable_mid: 1,
                                       viable_offlane: 0)

      lion.add_role(:disabler, 3)
      lion.add_role(:nuker, 3)
      lion.add_role(:lane_support, 2)
      lion.add_role(:support, 1)

      witch_doctor = FactoryGirl.create(:hero, name: "Witch Doctor",
                                               team: :dire,
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
                                               viable_mid: 1,
                                               viable_offlane: 0)

      witch_doctor.add_role(:support, 3)
      witch_doctor.add_role(:disabler, 2)

      enigma = FactoryGirl.create(:hero, name: "Enigma",
                                         team: :dire,
                                         attack_type: :ranged,
                                         main_attribute: :intelligence,
                                         viable_mid: 0,
                                         viable_offlane: 0)

      enigma.add_role(:disabler, 2)
      enigma.add_role(:initiator, 2)
      enigma.add_role(:jungler, 2)
      enigma.add_role(:pusher, 2)

      necrophos = FactoryGirl.create(:hero, name: "Necrophos",
                                            team: :dire,
                                            attack_type: :ranged,
                                            main_attribute: :intelligence,
                                            viable_mid: 2,
                                            viable_offlane: 0)

      necrophos.add_role(:support, 2)
      necrophos.add_role(:durable, 2)
      necrophos.add_role(:carry, 2)

      warlock = FactoryGirl.create(:hero, name: "Warlock",
                                          team: :dire,
                                          attack_type: :ranged,
                                          main_attribute: :intelligence,
                                          viable_mid: 0,
                                          viable_offlane: 0)

      warlock.add_role(:initiator, 3)
      warlock.add_role(:lane_support, 3)
      warlock.add_role(:disabler, 1)

      queen_of_pain = FactoryGirl.create(:hero, name: "Queen of Pain",
                                                team: :dire,
                                                attack_type: :ranged,
                                                main_attribute: :intelligence,
                                                viable_mid: 3,
                                                viable_offlane: 0)

      queen_of_pain.add_role(:nuker, 2)
      queen_of_pain.add_role(:carry, 2)

      death_prophet = FactoryGirl.create(:hero, name: "Death Prophet",
                                                team: :dire,
                                                attack_type: :ranged,
                                                main_attribute: :intelligence,
                                                viable_mid: 2,
                                                viable_offlane: 0)

      death_prophet.add_role(:pusher, 3)
      death_prophet.add_role(:nuker, 2)
      death_prophet.add_role(:durable, 2)

      pugna = FactoryGirl.create(:hero, name: "Pugna",
                                        team: :dire,
                                        attack_type: :ranged,
                                        main_attribute: :intelligence,
                                        viable_mid: 1,
                                        viable_offlane: 1)

      pugna.add_role(:nuker, 2)
      pugna.add_role(:pusher, 2)
      pugna.add_role(:support, 2)

      dazzle = FactoryGirl.create(:hero, name: "Dazzle",
                                         team: :dire,
                                         attack_type: :ranged,
                                         main_attribute: :intelligence,
                                         viable_mid: 0,
                                         viable_offlane: 0)

      dazzle.add_role(:lane_support, 3)

      leshrac = FactoryGirl.create(:hero, name: "Leshrac",
                                          team: :dire,
                                          attack_type: :ranged,
                                          main_attribute: :intelligence,
                                          viable_mid: 0,
                                          viable_offlane: 1)

      leshrac.add_role(:nuker, 3)
      leshrac.add_role(:pusher, 3)
      leshrac.add_role(:disabler, 1)
      leshrac.add_role(:support, 1)

      dark_seer = FactoryGirl.create(:hero, name: "Dark Seer",
                                            team: :dire,
                                            attack_type: :melee,
                                            main_attribute: :intelligence,
                                            viable_mid: 1,
                                            viable_offlane: 3)

      dark_seer.add_role(:initiator, 3)
      dark_seer.add_role(:nuker, 1)

      batrider = FactoryGirl.create(:hero, name: "Batrider",
                                           team: :dire,
                                           attack_type: :ranged,
                                           main_attribute: :intelligence,
                                           viable_mid: 3,
                                           viable_offlane: 2)

      batrider.add_role(:initiator, 3)
      batrider.add_role(:disabler, 2)
      batrider.add_role(:nuker, 2)

      ancient_apparition = FactoryGirl.create(:hero, name: "Ancient Apparition",
                                                     team: :dire,
                                                     attack_type: :ranged,
                                                     main_attribute: :intelligence,
                                                     viable_mid: 0,
                                                     viable_offlane: 0)

      ancient_apparition.add_role(:support, 3)
      ancient_apparition.add_role(:disabler, 2)

      invoker = FactoryGirl.create(:hero, name: "Invoker",
                                          team: :dire,
                                          attack_type: :ranged,
                                          main_attribute: :intelligence,
                                          viable_mid: 3,
                                          viable_offlane: 1)

      invoker.add_role(:carry, 2)
      invoker.add_role(:nuker, 2)
      invoker.add_role(:initiator, 2)

      outworld_devourer = FactoryGirl.create(:hero, name: "Outworld Devourer",
                                                    team: :dire,
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
                                                    viable_mid: 3,
                                                    viable_offlane: 0)

      outworld_devourer.add_role(:carry, 3)

      shadow_demon = FactoryGirl.create(:hero, name: "Shadow Demon",
                                               team: :dire,
                                               attack_type: :ranged,
                                               main_attribute: :intelligence,
                                               viable_mid: 1,
                                               viable_offlane: 0)

      shadow_demon.add_role(:support, 3)
      shadow_demon.add_role(:disabler, 2)
      shadow_demon.add_role(:nuker, 1)

      visage = FactoryGirl.create(:hero, name: "Visage",
                                         team: :dire,
                                         attack_type: :ranged,
                                         main_attribute: :intelligence,
                                         viable_mid: 1,
                                         viable_offlane: 1)

      visage.add_role(:nuker, 3)
      visage.add_role(:durable, 2)
      visage.add_role(:disabler, 1)

      Hero.all.each {|hero| hero.save_role_elements }
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
      FactoryGirl.create(:role, name: :durable)
      FactoryGirl.create(:role, name: :support)
    end
  end
end
