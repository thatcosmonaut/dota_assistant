object false

child @recommendation => "recommendations" do
  attributes :id, :name
end

child @worst => "worst" do
  attributes :id, :name
end

if @ban_recommendations
  child @ban_recommendations => "ban_recommendations" do
    attributes :id, :name
  end
end

node :needed_roles do
  @needed_roles
end

node :filled_roles do
  @filled_roles
end
