object false

if @recommendation
  child @recommendation => "recommendations" do
    attributes :id, :name, :hero_name
  end
end

if @worst
  child @worst => "worst" do
    attributes :id, :name, :hero_name
  end
end

if @ban_recommendations
  child @ban_recommendations => "ban_recommendations" do
    attributes :id, :hero_name
  end
end

if @needed_roles
  node :needed_roles do
    @needed_roles.map { |role_name| role_name.to_s.titlecase }
  end
end

if @filled_roles
  node :filled_roles do
    @filled_roles.map { |role_name| role_name.to_s.titlecase }
  end
end
