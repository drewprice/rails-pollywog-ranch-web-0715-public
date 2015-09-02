class Frog < ActiveRecord::Base
  belongs_to :pond

  has_many :tadpoles

  def self.new_from_tadpole(tadpole)
    attributes = tadpole.attributes.delete_if { |k, _| k.include? 'id' }
    attributes['pond_id'] = tadpole.pond.id

    new(attributes)
  end
end
