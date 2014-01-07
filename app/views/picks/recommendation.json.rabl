object false

node :recommendations do
  @recommendation.map do |rec|
    { id: rec.id, name: rec.name }
  end
end

node :worst do
  @worst.map do |bad|
    { id: bad.id, name: bad.name }
  end
end

if @ban_recommendations
  node :ban_recommendations do
    @ban_recommendations.map do |rec|
      { id: rec.id, name: rec.name }
    end
  end
end

node :needed_role do
  @needed_role
end

node :filled_roles do
  @filled_roles
end
