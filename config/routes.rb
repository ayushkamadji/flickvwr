Rails.application.routes.draw do
  root "application#main"
  post '/', to: "application#get_flickr"
  get '/:id', to: "application#main"
end
