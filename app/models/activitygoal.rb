class Activitygoal < ActiveRecord::Base
  attr_accessible :annuale, :annualm, :annuals, :annualstatus, :apre, :aprm, :aprs, :aprstatus, :auge, :augm, :augs, :augstatus, :create_year, :dece, :decm, :decs, :decstatus, :febe, :febm, :febs, :febstatus, :goal_year, :jane, :janm, :jans, :janstatus, :jule, :julm, :juls, :julstatus, :june, :junm, :juns, :junstatus, :kind_goal_capture, :mare, :marm, :mars, :marstatus, :maye, :maym, :mays, :maystatus, :name, :nove, :novm, :novs, :novstatus, :octe, :octm, :octs, :octstatus, :presentation_advances, :sepe, :sepm, :seps, :sepstatus
  belongs_to :Activity
end
