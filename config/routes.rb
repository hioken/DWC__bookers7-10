Rails.application.routes.draw do
  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update]
  get 'chats/:companion_user' => 'chats#show', as: :chat_room
  post 'chats/:room_id' => 'chats#create', as: :room_chats
end
