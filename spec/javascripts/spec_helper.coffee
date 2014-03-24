#= require_tree ./templates

chai.Assertion.addProperty 'empty_hero_box', ->
  new chai.Assertion(@_obj.isEmpty()).to.be.true

chai.Assertion.addMethod 'hero_box_populated_with_hero', ({name, id}) ->
  new chai.Assertion(@_obj.isEmpty()).to.be.false

@sven = name: 'Sven', id: 2
@axe = name: 'Axe', id: 57
@earthshaker = name: 'Earthshaker', id: 1
@tiny = name: 'Tiny', id: 3
@kunkka = name: 'Kunkka', id: 4
