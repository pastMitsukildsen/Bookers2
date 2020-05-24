Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users, only: [:index, :show, :edit, :create, :update]
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy]
end


# user: show index
# book: index show

#     users GET    /users(.:format)                                    users#index
#           POST   /users(.:format)                                    users#create
#  new_user GET    /users/new(.:format)                                users#new
# edit_user GET    /users/:id/edit(.:format)                           users#edit
#      user GET    /users/:id(.:format)                                users#show
#           PATCH  /users/:id(.:format)                                users#update
#           PUT    /users/:id(.:format)                                users#update
#           DELETE /users/:id(.:format)                                users#destroy
