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

class Person < ApplicationRecord
  before_update  :check_email

  def update(args)
    if self.email == "Unknow email" && args.fetch(:email)
      self.email = args.fetch(:email)
    end

    if self.home_phone_number == "Unknow home_phone_number" && args.fetch(:home_phone_number)
      self.home_phone_number = args.fetch(:home_phone_number)
    end

    if self.mobile_phone_number == "000000" && args.fetch(:mobile_phone_number)
      self.mobile_phone_number = args.fetch(:mobile_phone_number)
    end


    if self.address == "Unknow address" && args.fetch(:address)
      self.address = args.fetch(:address)
    end

  end

  private
  def check_email
  end

end
