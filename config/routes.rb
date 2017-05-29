Rails.application.routes.draw do
  get 'static_pages/han'
  delete 'thumbnails/destroy'
  get 'thumbnails/show'
  get 't', to: 'thumbnails#show'

  get 'se', to: 'static_pages#han', language: 'svenska'
  get 'dk', to: 'static_pages#han', language: 'dansk'

  root 'static_pages#han'
end
