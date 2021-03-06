Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "homes#index"
  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Document resource:
  # CREATE
  get "/documents/new", :controller => "documents", :action => "new"
  post "/create_document", :controller => "documents", :action => "create"

  # READ
  get "/documents", :controller => "documents", :action => "index"
  get "/documents/:id", :controller => "documents", :action => "show"

  # UPDATE
  get "/documents/:id/edit", :controller => "documents", :action => "edit"
  post "/update_document/:id", :controller => "documents", :action => "update"

  # DELETE
  get "/delete_document/:id", :controller => "documents", :action => "destroy"
  #------------------------------

  # Routes for the Home resource:
  # CREATE
  get "/homes/new", :controller => "homes", :action => "new"
  post "/create_home", :controller => "homes", :action => "create"

  # READ
  get "/homes", :controller => "homes", :action => "index"
  get "/homes/:id", :controller => "homes", :action => "show"

  # UPDATE
  get "/homes/:id/edit", :controller => "homes", :action => "edit"
  post "/update_home/:id", :controller => "homes", :action => "update"

  # DELETE
  get "/delete_home/:id", :controller => "homes", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
