ActiveRecord::Schema.define(:version => 0) do
  create_table :users, :force => true do |t|
    t.string :email, :password, :roles
  end
  
  create_table :roles, :force => true do |t|
    t.string :role, :name
  end
  
  create_table :user_roles, :force => true do |t|
    t.belongs_to :user, :role
  end
end
