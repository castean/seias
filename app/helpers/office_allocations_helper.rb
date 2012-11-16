module OfficeAllocationsHelper
  def fill_user_select(f)
    f.select :user_id, {}, {:prompt => '-- Seleciona un usuario --'}, {:id=>"user_id"}
  end
end
