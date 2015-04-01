MultiSiteSurveyApp::Application.routes.draw do
  resources :surveys do
    resources :questions
  end
  root :to => redirect('/surveys')
end
