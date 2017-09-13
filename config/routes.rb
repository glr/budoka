Rails.application.routes.draw do
  get 'secrets/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # config/routes.rb

  root :to => "secrets#show"

  post "graphql" => "graphqls#create"

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

end
