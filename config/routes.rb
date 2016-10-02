Rails.application.routes.draw do
  get 'static_pages/han'

  root 'static_pages#han'
end
