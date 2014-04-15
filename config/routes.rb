DotaAssistant::Application.routes.draw do
  root to: "picks#hero_picker"
  get 'pick_assistant' => 'picks#hero_picker'
  post 'pick_assistant' => 'picks#recommendation'
  post 'remaining_builds' => 'picks#remaining_builds'
  post 'remaining_heroes' => 'picks#remaining_heroes'
end
