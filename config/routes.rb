Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/home", to: "welcome#home")
  get("/about", to: "welcome#about")
  get("/", { to: "welcome#home", as: :root })
  get("/admin/panel", to: "welcome#admin_panel")
  get("/dashboard", to: "welcome#dashboard")
  # get("quizzes/:id/take_quiz", to: "quizzes#show")
  post("quizzes/:id/answers", to: "questions#create_answer")
  get("/todo", to: "quiz_assignments#user_assignments")

  resources :results
  resources :quiz_assignments
  resource :session, only: [:new, :create, :destroy]
  resources :departments
  resources :roles
  resources :quizzes do
    resources :questions do
      resources :options
    end
  end

  resources :users
end
