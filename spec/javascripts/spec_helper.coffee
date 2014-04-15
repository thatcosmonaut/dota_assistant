#= require_tree ./templates

chai.Assertion.addProperty 'empty_hero_box', ->
  new chai.Assertion(@_obj.isEmpty()).to.be.true

chai.Assertion.addMethod 'hero_box_populated_with_hero', ({name, id}) ->
  new chai.Assertion(@_obj.isEmpty()).to.be.false

chai.Assertion.addMethod 'have_text', (text) ->
  new chai.Assertion(@_obj.text()).to.equal text

chai.Assertion.addProperty 'visible', ->
  new chai.Assertion(@_obj.is(':visible')).to.be.true

chai.Assertion.addProperty 'hidden', ->
  new chai.Assertion(@_obj.is(':visible')).to.be.false

@carry_sven = hero_name: 'Sven', name: 'Carry', id: 2
@initiator_axe = hero_name: 'Axe', name: 'Initiator', id: 57
@initiator_earthshaker = hero_name: 'Earthshaker', name: 'Initiator', id: 1
@carry_tiny = hero_name: 'Tiny', name: 'Carry', id: 3
@initiator_kunkka = hero_name: 'Kunkka', name: 'Initiator', id: 4

@sven = name: 'Sven', id: 2
@axe = name: 'Axe', id: 57
@earthshaker = name: 'Earthshaker', id: 1
@tiny = name: 'Tiny', id: 3
@kunkka = name: 'Kunkka', id: 4
