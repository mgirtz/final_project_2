Rails.application.routes.draw do
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
