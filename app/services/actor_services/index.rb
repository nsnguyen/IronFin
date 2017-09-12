# frozen_string_literal: true

module ActorServices
  class Index
    attr_accessor :first_name, :last_name, :sex, :date_of_birth, :date_of_death

    def initialize(first_name:, last_name:, sex:, date_of_birth:, date_of_death:)
      self.first_name = first_name
      self.last_name = last_name
      self.sex = sex
      self.date_of_birth = date_of_birth
      self.date_of_death = date_of_death

    end

    def run

      actor = Actor.find(1)
      actor

    end

  end
end