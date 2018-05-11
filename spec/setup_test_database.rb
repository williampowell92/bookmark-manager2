con = PG.connect :dbname => 'bookmark_manager_test'
rs = con.exec 'SET client_min_messages TO WARNING;'
rs = con.exec 'TRUNCATE TABLE bookmarks CASCADE'
