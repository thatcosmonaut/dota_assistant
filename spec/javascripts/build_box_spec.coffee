#= require spec_helper
#= require jquery
#= require application

describe 'BuildBox', ->

  beforeEach ->
    $('body').html JST['templates/build_box']()
    @build_box = new BuildBox $('.character')

  describe 'show', ->

    beforeEach ->
      @build_box.show carry_sven

    it 'has the correct label class', ->
      expect($('.character label').hasClass('sven')).to.be.true

    it 'has the correct build name', ->
      expect($('.character .build')).to.have_text 'Carry'

    it 'displays the build name', ->
      expect($('.character .build')).to.be.visible

    it 'has the correct id attribute', ->
      expect($('.character').data('hero-id')).to.equal 2

    it 'has the correct name', ->
      expect($('.character .name')).to.have_text 'Sven'

  describe 'name', ->

    context 'there is a hero in the box', ->

      beforeEach ->
        @build_box.show carry_sven

      it 'returns the correct build name', ->
        expect(@build_box.name()).to.equal 'Carry'

    context 'there is no hero in the box', ->

      it 'returns empty string', ->
        expect(@build_box.name()).to.equal ''

  describe 'heroId', ->
    context 'there is a build in the box', ->

      beforeEach ->
        @build_box.show carry_sven

      it 'returns the hero id', ->
        expect(@build_box.heroId()).to.equal 2

    context 'there is not a hero in the box', ->

      it 'returns null', ->
        expect(@build_box.heroId()).to.be.null

  describe 'heroName', ->
    context 'there is a build in the box', ->

      beforeEach ->
        @build_box.show carry_sven

      it 'returns the hero name', ->
        expect(@build_box.heroName()).to.equal 'Sven'

    context 'there is not a hero in the box', ->
      it 'returns empty string', ->
        expect(@build_box.heroName()).to.equal ''

  describe 'clear', ->

    beforeEach ->
      @build_box.show carry_sven
      @build_box.clear()

    it 'removes the label class', ->
      expect($('.character label').hasClass('sven')).to.be.false

    it 'should still have hero_big class on label', ->
      expect($('.character label').hasClass('hero_big')).to.be.true

    it 'removes the name text', ->
      expect($('.character .name')).to.have_text ''

    it 'removes the hero-id data attribute', ->
      expect($('.character').data('hero-id')).to.be.undefined

    it 'hides the build div', ->
      expect($('.character .build')).to.be.hidden

    it 'sets build_data to null', ->
      expect(@build_box.build_data).to.be.null

  describe 'heroCssName', ->

    context 'there is a build in the box', ->

      it 'lowercases the string', ->
        @build_box.show name: 'Carry', hero_name: 'Sven', id: 1
        expect(@build_box.heroCssName()).to.equal 'sven'

      it 'replaces the spaces with dashes', ->
        @build_box.show name: 'Ganker', hero_name: 'Night Stalker', id: 1
        expect(@build_box.heroCssName()).to.equal 'night-stalker'

      it 'removes apostrophes', ->
        @build_box.show name: 'Initiator', hero_name: "Assbear's", id: 1
        expect(@build_box.heroCssName()).to.equal 'assbears'

    context 'box is empty', ->

      it 'returns the empty string', ->
        expect(@build_box.heroCssName()).to.equal ''

  describe 'isEmpty', ->

    context 'box contains a build', ->
      expect(@build_box.isEmpty()).to.be.false

    context 'box is empty', ->
      expect(@build_box.isEmpty()).to.be.true
