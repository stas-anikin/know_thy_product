Rails.application.routes.draw do
  get "page/index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/home", to: "welcome#home")
  get("/about", to: "welcome#about")
  get("/", { to: "welcome#home", as: :root })
  get("/admin/panel", to: "welcome#admin_panel")
  get("/dashboard", to: "welcome#dashboard")
  resources :results
  resource :session, only: [:new, :create, :destroy]
  resources :departments
  resources :roles
  resources :quizzes do
    resources :questions
    resources :answers
  end

  resources :users
end
