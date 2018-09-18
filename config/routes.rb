Rails.application.routes.draw do

	root to: 'user/top#index'

  devise_for :admins, path: 'admin/admins', controllers: {
	  sessions:      'admin/admins/sessions',
	  passwords:     'admin/admins/passwords',
	  registrations: 'admin/admins/registrations'
	}
	devise_for :users, path: 'user/users', controllers: {
	  sessions:      'user/users/sessions',
	  passwords:     'user/users/passwords',
	  registrations: 'user/users/registrations'
	}

	namespace :user, path: 'user' do
		resources :teams do 
			resources :practices do
				resources :participants, only: [:create]
			end
		end
		
		resources :photos 

		resources :participants, only: [:index]
		resources :manages
		resources :conversations do
			resources :messages
		end
		get 'manage-team/:id/basics' => 'teams#basics', as: 'manage_team_basics'
		get 'manage-team/:id/address' => 'teams#address', as: 'manage_team_address'
		get 'manage-team/:id/photo' => 'teams#photo', as: 'manage_team_photo'
		get 'manage-team/:id/photos/list' => 'photos#list'
		delete 'manage-team/:id/photos/:id' => 'photos#destroy'
		get 'manage-team/:id/photos/create' => 'photos#create'

		get '/search' => 'teams#search'
	end

	namespace :admin, path: 'admin' do
		resources :sports
	end
end
