class Material < ActiveRecord::Base
  actable

  validates :name, presence: true
  validates :description, presence: true, uniqueness: true

  def friendly_description all_attributes
    all_attributes.except('name').reduce('') do |description, (attr_name, attr_value)|
      description + attr_friendly_description(attr_name, attr_value) + ', '
    end.chomp(", ")
  end

  def attr_friendly_description name, value
    case name
    when 'ufsc_id'
      "código ufsc: #{value}"
    when 'quantity'
      "#{value} un"
    else
      "#{name} #{value}"
    end
  end

  def name_with_description
     "#{name}, #{description}"
  end

  def route_path
    "#{self.actable_type.underscore}_path"
  end

  def edit_path
    "edit_#{route_path}"
  end
end
