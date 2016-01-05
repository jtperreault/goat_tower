Rails.application.routes.draw do
  resources :games,   except: [:new, :edit], defaults: {format: :json}
  resources :players, except: [:new, :edit], defaults: {format: :json}
  resources :commands,  only: [:index],      defaults: {format: :json}
end
