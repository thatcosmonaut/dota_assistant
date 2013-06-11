DotaAssistant::Application.routes.draw do
  get 'pick_assistant' => 'picks#hero_picker'
  post 'pick_assistant' => 'picks#recommendation'
end
