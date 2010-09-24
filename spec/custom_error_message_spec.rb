require 'rubygems'
require 'spec'
require 'active_record'

class User < ActiveRecord::Base
  has_many :user_roles
  has_many :roles, :through => :user_roles
  
  validates_presence_of :email, :message => "^Your email is invalid"
  
  accepts_nested_attributes_for :roles 
end

class Role < ActiveRecord::Base
  has_many :user_roles
  has_many :users, :through => :user_roles
  
  validates_presence_of :role, :message => "^You must enter a role"
end

class UserRole < ActiveRecord::Base
  belongs_to :role
  belongs_to :user
end

require 'custom_error_message'

describe "validating attributes" do
  before do
    ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
    load File.join(File.dirname(__FILE__), 'db', 'schema.rb')
  end
  
  it "should return the message specified without a prefix" do
    @user = User.create
    @user.errors.full_messages.should include "Your email is invalid"
  end
  
  describe "validating nested attributes" do
    it "should return the message specified without a prefix" do
      @user = User.create(:roles_attributes => [{}])
      @user.errors.full_messages.should include "You must enter a role"
    end
  end
end