class Counter < ActiveRecord::Base
  belongs_to :weak, class_name: Hero
  belongs_to :strong, class_name: Hero
end
