# == Schema Information
#
# Table name: people
#
#  id                  :integer          not null, primary key
#  reference           :integer          not null
#  email               :string           default("Unknow email")
#  home_phone_number   :string           default("Unknow home_phone_number")
#  mobile_phone_number :string           default("000000")
#  firstname           :string           default("Unknow firstname")
#  lastname            :string           default("Unknow lastname")
#  address             :string           default("Unknow address")
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'
require 'pry'

class PersonTest < ActiveSupport::TestCase
  test "Assert an new user could be created" do
    Person.create(
      reference: 1,
      email: "keitamori@gmail.com",
      home_phone_number: "09765787T57",
      firstname: "mori",
      lastname: "keita",
      address: "somewhere"
    )
    assert_equal 3, Person.count
  end

  test "Assert save attributes only when person_attribute in database is unknow" do
    john = people(:john)
    jane = people(:jane)

    john.update(
      email: "mrunknow@gmail.com", 
      address: "ELLIS ISLAND", 
      home_phone_number: "00976554677",
      mobile_phone_number: "09756758"
    )

    jane.update(
      email: "missunknow@gmail.com",
      home_phone_number: "0988765678",
      address: "Rue de Rivoli Paris",
      mobile_phone_number: "09756758"
    )
    john.save
    jane.save
    assert_equal "johndoe@unknow.com" , Person.first.email
    assert_equal "sycamore tree NY" , Person.first.address
    assert_equal "0987598767" , Person.first.home_phone_number
    assert_equal "0999999" , Person.first.mobile_phone_number

    assert_equal "missunknow@gmail.com" , Person.second.email
    assert_equal "Rue de Rivoli Paris" , Person.second.address
    assert_equal "0988765678" , Person.second.home_phone_number
    assert_equal "09756758" , Person.second.mobile_phone_number
  end

end
