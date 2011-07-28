Factory.define :gallery, :class => Gallery do |f|
  f.name { Factory.next :name }
  f.association :user, :factory => :user
end

Factory.sequence(:name) {|n| "Gallery #{n}" }

