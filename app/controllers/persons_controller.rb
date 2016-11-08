class PersonsController < ApplicationController
  def index
    @persons = Person.all.limit(100)
  end
end
