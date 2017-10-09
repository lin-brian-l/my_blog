Routing:
Unlike Sinatra, where the controller has both the HTTP verb and route (get '/entries' do, delete '/entries/:id', etc.), Rails splits this such that the route.rb file (/config/routes.rb) contains the HTTP verb, route, and controller action. The controller contains methods which correspond to the controller action "pointed at" by the HTTP verb and route.

Route Helpers:
Rather than typing out anchor tags containing Ruby interpolation, Rails offers route helper methods to speed up the process. However, these methods must be "primed" by declaring "resources :controller_name1, :controller_name2, etc." in the config/route.rb file (see lines 2 and 4 of the aforementioned file). Examples of this are provided below. (Note that all of these examples are in the view).
1) Lines 1-2 of entries/_entry_description.html.erb
2) Lines 5-6 of entries/_entry_description.html.erb
3) Lines 14 and 16 of views/layouts/application.html.erb


Named Routes (as:)
Named routes allow you to customize routes within the controller. It consists of three main parts: the HTTP verb & path, the erb and controller route it uses, and the route helper path that it follows. Examples of this are as provided below.
1) /login vs /sessions/new - lines 19-22 on config/routes.rb
2) /register vs /users/new - lines 28-35 on config/routes.rb

Custom Routing (changing controllers)
Custom routing can be used to link the "class" which a path is named after with a controller of a different name. For example, rather than having "photos" be associated with a "photos" controller, a user may want to be more generic and associate "photos" with an "images" controller. This is done by adding a controller specification to the "resouces" declaration in the config/route.rb file (see line 4) and ensuring that the name of that controller is present. Note that any view files rendered in that controller will need to share a folder of the same name, otherwise they will need to be specified (see posts_controller.rb for further details).
