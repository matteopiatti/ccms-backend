Rails.application.routes.draw do
  get "pages", to: "pages#index"
  get "pages/*slug", to: "pages#show", as: :page
  post "pages", to: "pages#create"
  delete "pages/:id", to: "pages#delete"
  patch "pages/:id", to: "pages#update"

  resources :components, only: [ :index, :create, :destroy, :update, :show ]
  resources :props, only: [ :index, :create, :destroy, :update ]
  resources :blocks, only: [ :index, :show, :create, :destroy, :update ]
  post "blocks/move/:id/:direction", to: "blocks#move"
end
