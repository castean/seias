#encoding:utf-8
class CatalogTable < ActiveRecord::Base
  has_and_belongs_to_many :critical_factors
  attr_accessible :name, :model, :table
end