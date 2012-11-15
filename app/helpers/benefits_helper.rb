module BenefitsHelper
  def fill_benefit_type_select(f)
    f.select :benefit_type_id, {}, {:prompt => '-- Seleciona un tipo de apoyo --'}, {:id=>"benefit_benefit_type_id"}
  end
end
