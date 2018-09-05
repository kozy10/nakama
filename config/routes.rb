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

	
end
