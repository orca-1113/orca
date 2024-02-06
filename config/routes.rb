Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :ecos do
    resources :likes, only: [:create, :destroy]
  end


  get 'ecos/top' => 'ecos#top'
  root 'ecos#top'

end
