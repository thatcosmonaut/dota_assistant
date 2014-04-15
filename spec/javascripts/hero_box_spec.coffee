#= require spec_helper
#= require jquery
#= require application

describe 'HeroBox', ->

  beforeEach ->
    $('body').html JST['templates/hero_box']()
    @hero_box = new HeroBox $('.character')

  describe 'show', ->

    beforeEach ->
      @hero_box.show sven

    it 'has the correct label class', ->
      expect($('.character label').hasClass('sven')).to.be.true

    it 'has the correct id attribute', ->
      expect($('.character').data("hero-id")).to.equal 2

    it 'has the correct name', ->
      expect($('.character .name')).to.have_text 'Sven'

  describe 'heroId', ->

    context 'there is a hero in the box', ->

      beforeEach ->
        @hero_box.show sven

      it 'returns the hero id', ->
        expect(@hero_box.heroId()).to.equal 2

    context 'there is not hero in the box', ->

      it 'returns null', ->
        expect(@hero_box.heroId()).to.be.null

  describe 'heroName', ->

    context 'there is a hero in the box', ->

      beforeEach ->
        @hero_box.show sven

      it 'returns the hero name', ->
        expect(@hero_box.heroName()).to.equal 'Sven'

    context 'there is not a hero in the box', ->

      it 'returns empty string', ->
        expect(@hero_box.heroName()).to.equal ''

  describe 'clear', ->

    beforeEach ->
      @hero_box.show sven
      @hero_box.clear()

    it 'removes the label class', ->
      expect($('.character label').hasClass('sven')).to.be.false

    it 'should still have hero_big class on label', ->
      expect($('.character label').hasClass('hero_big')).to.be.true

    it 'removes the name text', ->
      expect($('.character .name')).to.have_text ''

    it 'removes the hero-id data attribute', ->
      expect($('.character').data('hero-id')).to.be.undefined

    it 'sets hero_data to null', ->
      expect(@hero_box.hero_data).to.be.null

  describe 'heroCssName', ->

    context 'box contains a hero', ->

      it 'lowercases the string', ->
        @hero_box.show name: 'Sven', id: 1
        expect(@hero_box.heroCssName()).to.equal 'sven'

      it 'replaces the spaces with dashes', ->
        @hero_box.show name: 'Night Stalker', id: 1
        expect(@hero_box.heroCssName()).to.equal 'night-stalker'

      it 'removes apostrophes', ->
        @hero_box.show name: "Assbear's", id: 1
        expect(@hero_box.heroCssName()).to.equal 'assbears'

    context 'box is empty', ->

      it 'returns the empty string', ->
        expect(@hero_box.heroCssName()).to.equal ''

  describe 'isEmpty', ->

    context 'box is empty', ->

      it 'returns true', ->
        expect(@hero_box.isEmpty()).to.be.true

    context 'box contains a hero', ->

      beforeEach ->
        @hero_box.show sven

      it 'returns false', ->
        expect(@hero_box.isEmpty()).to.be.false
