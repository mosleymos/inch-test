# == Schema Information
#
# Table name: buildings
#
#  id           :integer          not null, primary key
#  reference    :integer          not null
#  address      :string           default("Unknow address")
#  zip_code     :string           default("Unknow zip_code")
#  country      :string           default("Unknow country")
#  manager_name :string           default("Unknow manager_name")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class BuildingTest < ActiveSupport::TestCase
   test "Assert should create a new building" do
     john = people(:john) 
     Building.create(
       reference: john.id,
       address: "Rue de Castiglione",
       zip_code: "75003",
       country: "France",
       manager_name: "HelloWorld",
     )
     assert_equal 3, Building.count
   end
end
