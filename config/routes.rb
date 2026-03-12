Rails.application.routes.draw do
  # Routes for the Photo resource:

  # CREATE
  post("/insert_photo", { :controller => "photos", :action => "create" })

  # READ
  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:path_id", { :controller => "photos", :action => "show" })

  # UPDATE

  post("/modify_photo/:path_id", { :controller => "photos", :action => "update" })

  # DELETE
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })

  #------------------------------

  # Routes for the Friendship resource:

  # CREATE
  post("/insert_friendship", { :controller => "friendships", :action => "create" })

  # READ
  get("/friendships", { :controller => "friendships", :action => "index" })

  get("/friendships/:path_id", { :controller => "friendships", :action => "show" })

  # UPDATE

  post("/modify_friendship/:path_id", { :controller => "friendships", :action => "update" })

  # DELETE
  get("/delete_friendship/:path_id", { :controller => "friendships", :action => "destroy" })

  #------------------------------

  # Routes for the Hometown resource:

  # CREATE
  post("/insert_hometown", { :controller => "hometowns", :action => "create" })

  # READ
  get("/hometowns", { :controller => "hometowns", :action => "index" })

  get("/hometowns/:path_id", { :controller => "hometowns", :action => "show" })

  # UPDATE

  post("/modify_hometown/:path_id", { :controller => "hometowns", :action => "update" })

  # DELETE
  get("/delete_hometown/:path_id", { :controller => "hometowns", :action => "destroy" })

  #------------------------------

  # Routes for the Haunt resource:

  # CREATE
  post("/insert_haunt", { :controller => "haunts", :action => "create" })

  # READ
  get("/haunts", { :controller => "haunts", :action => "index" })

  get("/haunts/:path_id", { :controller => "haunts", :action => "show" })

  # UPDATE

  post("/modify_haunt/:path_id", { :controller => "haunts", :action => "update" })

  # DELETE
  get("/delete_haunt/:path_id", { :controller => "haunts", :action => "destroy" })

  #------------------------------

  # Routes for the Recommendation resource:

  # CREATE
  post("/insert_recommendation", { :controller => "recommendations", :action => "create" })

  # READ
  get("/recommendations", { :controller => "recommendations", :action => "index" })

  get("/recommendations/:path_id", { :controller => "recommendations", :action => "show" })

  # UPDATE

  post("/modify_recommendation/:path_id", { :controller => "recommendations", :action => "update" })

  # DELETE
  get("/delete_recommendation/:path_id", { :controller => "recommendations", :action => "destroy" })

  #------------------------------

  devise_for :users
  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:
  # get("/your_first_screen", { :controller => "pages", :action => "first" })
end
