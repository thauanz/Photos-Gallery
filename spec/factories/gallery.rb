Factory.define :gallery do |f|
  f.name { Factory.next :name }
  f.association :user
end

Factory.sequence(:name) {|n| "Gallery #{n}" }

