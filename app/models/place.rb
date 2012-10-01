class Place
  include Mongoid::Document

  attr_accessor :name
  
  def chain_name
  	chain.name
  end
  
  def menu_items
  	chain.menu_items
  end
  
  def latitude
    coordinates[1]
  end
  def latitude=(lat)
    coordinates ||= []
    coordinates[1] = lat
  end
  def longitude
    coordinates[0]
  end
  def longitude=(lon)
    coordinates ||= []
    coordinates[0] = lon
  end


  field :street_address, type: String
  field :coordinates, type: Array
  belongs_to :chain, :inverse_of => :places
  validates_presence_of :coordinates, :chain
  validates_uniqueness_of :street_address

  def address
  	"#{chain_name}, #{street_address}"
  end

  include Geocoder::Model::Mongoid

  geocoded_by :street_address
  reverse_geocoded_by :coordinates, :address => :street_address
  before_validation :setup_geocoding

  def setup_geocoding
  	geocode if coordinates.blank?
  	reverse_geocode if street_address.blank?
  end

end
