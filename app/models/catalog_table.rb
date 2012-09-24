#encoding:utf-8
class CatalogTable < ActiveRecord::Base
  has_many :critical_factors
  attr_accessible :name, :model, :table
end