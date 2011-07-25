# == Schema Information
# Schema version: 20110725195649
#
# Table name: authentications
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  provider   :string(255)
#  uid        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  token      :string(255)
#

class Authentication < ActiveRecord::Base
  belongs_to :user
end
