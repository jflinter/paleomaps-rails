class MenuItem
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  embedded_in :chain, :inverse_of => :menu_items
  validates_presence_of :name
end
