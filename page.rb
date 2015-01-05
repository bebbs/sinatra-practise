require 'sinatra'
require 'data_mapper'

# Setup connection to database
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/todo_list.db")


# Create basic 'item' database model.
class Item
  include DataMapper::Resource
  property :id, Serial
  property :content, Text, :required => true
  property :done, Boolean, :required => true, :default => false
  property :created, DateTime
end

# Create database.
DataMapper.finalize.auto_upgrade!

