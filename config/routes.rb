Rails.application.routes.draw do
  resources :numbers, only: [:index]

  root to: redirect('/numbers')
end
