require 'csv'
require 'fileutils'
class ImportcsvController < ApplicationController
  around_action :manage_error

  def import
  end

  def update
    # Upload the csv files
    building_io = params[:building]
    person_io = params[:person]

    building_csv_path = Rails.root.join('public', 'uploads', building_io.original_filename)
    person_csv_path = Rails.root.join('public', 'uploads', person_io.original_filename)

    # Copy files in public/uploads
    File.open(building_csv_path, 'wb') do |file|
      file.write(building_io.read)
    end

    File.open(person_csv_path,'wb') do |file|
      file.write(person_io.read)
    end

    # Treat the building csv
    CSV.foreach(building_csv_path, headers: true) do |building|
      Building.find_or_create_by(building.to_h)  do |building_elt|
        building_elt.update(building.to_h)
      end
    end

    # Treat the csv person
    CSV.foreach(person_csv_path, headers: true) do |person|
      Person.find_or_create_by(person.to_h)  do |person_elt|
        person_elt.update(person.to_h)
      end
    end

    # Clean csv files when finished
    FileUtils.rm_r Dir.glob(Rails.root.join('public', 'uploads', '*.csv')), force: true

    # Render status
    redirect_to '/notification'
  end

  private

  def manage_error
    begin
      yield
    rescue
      server_error_page
    end
  end

  def server_error_page
    redirect_to '/server_error'
  end
end
