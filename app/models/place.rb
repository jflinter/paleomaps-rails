class Place
  include Mongoid::Document

  attr_accessor :name
  
  def chain_name
  	chain.name
  end
  
  def menu_items
  	chain.menu_items
  end
  
  field :street_address, type: String
  field :coordinates, type: Array
  belongs_to :chain, :inverse_of => :places
  validates_presence_of :coordinates, :chain

  def address
  	"#{chain_name}, #{street_address}"
  end

  include Geocoder::Model::Mongoid

  geocoded_by :address
  reverse_geocoded_by :coordinates, :address => :street_address
  before_validation :setup_geocoding

  def setup_geocoding
  	geocode if coordinates.blank?
  	reverse_geocode if street_address.blank?
  end

end
