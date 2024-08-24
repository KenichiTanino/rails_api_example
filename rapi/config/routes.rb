# frozen_string_literal: true

Rails.application.routes.draw do
  scope format: 'json' do
    resources :addrs
  end
end
