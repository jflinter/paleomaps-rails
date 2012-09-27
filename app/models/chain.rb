class Chain
  include Mongoid::Document
  field :name, type: String
  validates_presence_of :name
  has_many :places, :inverse_of => :chain
  embeds_many :menu_items
end
