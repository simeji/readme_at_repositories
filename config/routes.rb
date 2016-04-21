Rails.application.routes.draw do
match "rar_project_settings/update(/:id(/:tab))" => "rar_project_settings#update", :via => 'post'
end
