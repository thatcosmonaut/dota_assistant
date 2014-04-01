object @remaining

node(:label) { |obj| "#{obj.hero.name} (#{obj.name})" }
node(:value) { |obj| obj.id }
