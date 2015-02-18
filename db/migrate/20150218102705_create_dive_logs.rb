class CreateDiveLogs < ActiveRecord::Migration
  def change
    create_table :dive_logs do |t|
      t.string      :date
      t.string      :visibility
      t.string      :location
      t.string      :temperature
      t.string      :exposure_protection
      t.string      :condition
      t.integer     :start_psi
      t.integer     :end_psi
      t.integer     :depth
      t.time        :time_in
      t.time        :time_out
      t.float       :bottom_time
      t.text        :comment
      t.references  :user

      t.timestamps
    end
  end
end
