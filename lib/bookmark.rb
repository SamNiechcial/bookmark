# frozen_string_literal: true

require 'pg'
require 'sinatra/flash'

# This class performs the logic heavy lifting for the model
class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title = 'untitled')
    @id = id
    @url = url
    @title = title
  end

  def self.connection
    if ENV['ENVIROMENT'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.all
    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |bmrk| Bookmark.new(bmrk['id'], bmrk['url'], bmrk['title']) }
  end

  def self.create(params)
    return false unless url?(params)
    result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{params[:url]}', '#{params[:title]}') RETURNING id, url, title")
    Bookmark.new(result.first['id'], result.first['url'], result.first['title'])
  end

  def ==(other)
    @id == other.id
  end

  private_class_method

  def self.url?(params)
    params[:url] =~ /\A#{URI.regexp(%w[http https])}\z/
  end
end
