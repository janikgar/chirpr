Rails.application.routes.draw do
  root 'epicenter#feed'

  get 'whats_trending' => 'epicenter#whats_trending'
  get 'following' => 'epicenter#following' # Who the user is following
  get 'followers' => 'epicenter#followers' #Who is following the user
  get 'all_users' => 'epicenter#all_users'
  get 'show_user' => 'epicenter#show_user'
  get 'now_following' => 'epicenter#now_following'
  get 'unfollow' => 'epicenter#unfollow'
  get 'new_chirp' => 'chirps#new'
  get 'chirp_tags' => 'epicenter#chirp_tags'

  resources :chirps
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
