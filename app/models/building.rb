# == Schema Information
#
# Table name: buildings
#
#  id           :integer          not null, primary key
#  reference    :integer          not null
#  address      :string           default("Unknow address")
#  zip_code     :string           default("Unknow zip_code")
#  city         :string           default("Unknow city")
#  country      :string           default("Unknow country")
#  manager_name :string           default("Unknow manager_name")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Building < ApplicationRecord
  def update(args)

    if self.manager_name == "Unknow manager_name" && args.fetch(:manager_name)
      self.manager_name = args.fetch(:manager_name)
    end

  end
end
