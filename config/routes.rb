Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'logins#welcome'
  get '/callback', to: 'logins#callback'
  get '/repos', to: 'logins#repos'
end
