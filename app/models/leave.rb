class Leave < ActiveRecord::Base
	belongs_to :user

	validates :from_date,  presence: true
	validates :to_date,  presence: true
    validates_numericality_of :no_of_days, 
                          :greater_than_or_equal_to =>0, 
                          :message => "To_date must be greater than from_date"

	validates :type_of_leave,  presence: true

end
