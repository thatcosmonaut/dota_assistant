#= require_tree ./templates

chai.Assertion.addProperty 'empty_hero_box', ->
  new chai.Assertion(@_obj.isEmpty()).to.be.true

chai.Assertion.addMethod 'hero_box_populated_with_hero', ({name, id}) ->
  new chai.Assertion(@_obj.isEmpty()).to.be.false

@sven = hero_name: 'Sven', name: 'Carry', id: 2
@axe = hero_name: 'Axe', name: 'Initiator', id: 57
@earthshaker = hero_name: 'Earthshaker', name: 'Initiator', id: 1
@tiny = hero_name: 'Tiny', name: 'Carry', id: 3
@kunkka = hero_name: 'Kunkka', name: 'Initiator', id: 4
