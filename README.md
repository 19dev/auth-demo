# Nasıl?

GÜNCELLENECEK: https://github.com/19bal/vys_rails/blob/auth/README.md ile.

Post,

    $ rails g scaffold post title:string content:text
    $ rake db:migrate
    $ rails s --binding=1.2.3.4 --port=3001

Test: http://1.2.3.4:3001/posts adresi üzerinde CRUD olanağı verir.
Fakat herkese açıktır.

User,

    $ rails g model user username:string password_digest:string
    $ rake db:migrate

    $ vim app/models/user.rb
    has_secure_password

    $ rails g controller sessions new
    $ vim app/controllers/sessions_controller.rb
    def create
      user = User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to posts_path
      else
        flash.now.alert = "Invalid username or password"
        render "new"
      end
    end

    $ vim app/views/sessions/new.html.erb
    <h1>Login</h1>
    <%= form_tag sessions_path do %>
    <div class="field">
      <%= label_tag "Username" %>
      <%= text_field_tag :username, params[:username] %>
    </div>
    <div class="field">
      <%= label_tag :password %>
      <%= password_field_tag :password %>
    </div>
    <div class="actions">
      <%= submit_tag "Login" %>
    </div>
    <% end %>

    $ vim config/routes.rb
    resources :sessions
    resources :posts
    get "login" => "sessions#new", :as => "login"

Yeni kullanıcı,

    $ vim Gemfile
    gem 'bcrypt-ruby', '~> 3.0.0'
    $ bundle

    $ rails c
    > User.create(:username => "seyyah", :password => "secret",
     :password_confirmation => "secret")

Flash mesajlarını göstermek için,

    $ vim app/views/layouts/application.html.erb
    <div class="container" style="margin-bottom: 80px;" >
       <div class="content">
         <div class="row">
           <div class="span9">
            <% [:notice, :error, :alert].each do |level| %>
              <% unless flash[level].blank? %>
                <div data-alert="alert" class="alert alert-<%= level %> fade in">
                    <a class="close" data-dismiss="alert" href="#">&times;</a>
                    <%= content_tag :p, simple_format(flash[level]) %>
                </div>
               <% end %>
            <% end %>
           </div>
       </div>
    </div>

Test: http://1.2.3.4:3001/login adresine gidip "seyyah":"secret" çiftini
deneyin.

# Kaynaklar

- Cancan: <https://github.com/seyyah/my-devise-cancan/tree/cancan>

- Simple auth:
<http://jeremyjbarth.blogspot.com/2011/10/rails-31-simple-custom-authentication.html>
