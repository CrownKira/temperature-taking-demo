Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "post/index"
      post :auth, to: "authentication#create"
      get "/auth" => "authentication#fetch"
      get "/temperatures", to: "temperatures#index"
      post "/temperature", to: "temperatures#create"
      get "/temperature", to: "temperatures#show"
    end
  end
end

# http://localhost:3000/api/v1/post/index
# CREATE USER
# http://localhost:3000/users
# AUTHORISE USER
# will receive a token
# http://localhost:3000/api/v1/auth
