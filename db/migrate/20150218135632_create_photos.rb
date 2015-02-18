class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string      :url
      t.references  :dive_logs
    end
  end
end
