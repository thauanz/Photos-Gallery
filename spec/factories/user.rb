Factory.define :user, :class => User do |f|
  f.full_name { Factory.next :full_name }
  f.email { Factory.next :email }
  f.password "password"
  f.password_confirmation "password"
end

Factory.sequence(:full_name) {|n| "Joaquim #{n}" }
Factory.sequence(:email) {|n| "myname#{n}@gmail.com" }

