rails new sti_test
cd sti_test/

rails g model Person name:string email:string type:string
cd app/model/

touch user.rb
echo "class User < Person; has_many :posts; end" >> user.rb

touch admin.rb
echo "class Admin < Person; has_many :accounts; end" >> admin.rb

cd ..
cd ..

rails g model Post content:string user:references
rails g model Account account_number:integer admin:references

rake db:migrate

rails c

user = User.create(name:"Sudeep", email:"sudeep@gmail.com")
post = user.posts.build content:"Language" description:"Ruby"
post.save

admin = Admin.create(name:"Sudeep_Admin", email:"sudeep@gmail.com")
account = admin.accounts.build account_number:1
account.save