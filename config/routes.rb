Rails.application.routes.draw do

  root 'demo#index'

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end

  #  get 'sections/index'
  #  get 'sections/show'
  #  get 'sections/new'
  #  get 'sections/edit'
  #  get 'sections/delete'
  #  get 'pages/index'
  #  get 'pages/show'
  #  get 'pages/new'
  #  get 'pages/edit'
  #  get 'pages/delete'
  #  get 'subjects/index'
  #  get 'subjects/show'
  #  get 'subjects/new'
  #  get 'subjects/edit'
  #  get 'subjects/delete'


  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
