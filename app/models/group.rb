class Group < ActiveRecord::Base

  has_many :groupings
  has_many :users, through: :groupings
  has_many :proportions, through: :groupings  
  has_many :bills
  has_many :bill_types

  # before_save do
  #   raise "no users in group!" if users.empty?
  # end

  scope :group_bill_types, -> (group_id) { find(group_id).bill_types }

  def calculate_total
    write_attribute :total, bills.map(&:amount).inject(:+)  
  end

  def calculate_percentage

    
  end

end