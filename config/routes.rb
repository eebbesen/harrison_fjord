Rails.application.routes.draw do
  get 'static_pages/han'
  get 'thumbnails/show'

  root 'static_pages#han'
end
