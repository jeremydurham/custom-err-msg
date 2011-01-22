require 'rubygems'
require 'rspec'
require 'active_record'
require 'custom_error_message'

class User < ActiveRecord::Base
  has_many :user_roles
  has_many :roles, :through => :user_roles
  
  validates_presence_of :name
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

describe "error messages" do
  before do
    ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
    load File.join(File.dirname(__FILE__), 'db', 'schema.rb')
  end
  
  describe "with standard messages" do
    it "should return a standard error message" do
      @user = User.create
      @user.errors.full_messages.should include "Name can't be blank"
    end
  end
  
  describe "with custom messages" do
    it "should return the full message specified" do
      @user = User.create
      @user.errors.full_messages.should include "Your email is invalid"
    end
    
    describe "on nested attributes" do
      it "should return the full message specified" do
        @user = User.create(:roles_attributes => [{}])
        @user.errors.full_messages.should include "You must enter a role"
      end
    end    
  end  
end