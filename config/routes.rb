Rails.application.routes.draw do

  resources :events, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  # catch all routing errors
  match '*path', via: :all, to: 'application#error404'
end
