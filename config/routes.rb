Rails.application.routes.draw do
  get 'sign_in', to: 'login#sign_in'
  get 'sign_up', to: 'login#sign_up'

  post 'perform_sign_in', to: 'login#perform_sign_in'
  post 'perform_sign_up', to: 'login#perform_sign_up'
  post 'sign_out', to: 'login#sign_out'

  resources :books, only: %i[index new edit]

  root 'welcome#start'
end
