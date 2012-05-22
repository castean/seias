class CreateActivitygoals < ActiveRecord::Migration
  def change
    create_table :activitygoals do |t|
      t.string :name
      t.string :presentation_advances
      t.string :kind_goal_capture
      t.date :goal_year
      t.date :create_year
      t.string :annualm
      t.string :annuals
      t.string :annuale
      t.string :annualstatus
      t.string :janm
      t.string :jans
      t.string :jane
      t.string :janstatus
      t.string :febm
      t.string :febs
      t.string :febe
      t.string :febstatus
      t.string :marm
      t.string :mars
      t.string :mare
      t.string :marstatus
      t.string :aprm
      t.string :aprs
      t.string :apre
      t.string :aprstatus
      t.string :maym
      t.string :mays
      t.string :maye
      t.string :maystatus
      t.string :junm
      t.string :juns
      t.string :june
      t.string :junstatus
      t.string :julm
      t.string :juls
      t.string :jule
      t.string :julstatus
      t.string :augm
      t.string :augs
      t.string :auge
      t.string :augstatus
      t.string :sepm
      t.string :seps
      t.string :sepe
      t.string :sepstatus
      t.string :octm
      t.string :octs
      t.string :octe
      t.string :octstatus
      t.string :novm
      t.string :novs
      t.string :nove
      t.string :novstatus
      t.string :decm
      t.string :decs
      t.string :dece
      t.string :decstatus

      t.timestamps
    end
  end
end
