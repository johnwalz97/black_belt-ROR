Rails.application.routes.draw do
    root to: 'shoes#index'
    
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'

    get '/signup' => 'users#new'
    post '/users' => 'users#create'
    
    post '/shoes' => 'shoes#create'
    post '/shoe/delete' => 'shoes#destroy'
    post '/shoe/buy' => 'shoes#buy'
    
    get '/dashboard' => 'dashboard#index'
end
