# frozen_string_literal: true

require 'pg'

def clearout
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec('TRUNCATE bookmarks;')
end
