class EnableUuidExtension < ActiveRecord::Migration[6.1]
  def change
    exec_query("CREATE EXTENSION IF NOT EXISTS plpgsql SCHEMA shared_extensions;")
  end
end
