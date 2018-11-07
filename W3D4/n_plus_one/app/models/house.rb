# == Schema Information
#
# Table name: houses
#
#  id         :bigint(8)        not null, primary key
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class House < ApplicationRecord
  has_many :gardeners,
    class_name: 'Gardener',
    foreign_key: :house_id,
    primary_key: :id

  has_many :plants,
    through: :gardeners,
    source: :plants

  def n_plus_one_seeds
    plants = self.plants
    seeds = []
    plants.each do |plant|
      seeds << plant.seeds
    end

    seeds
  end

  def better_seeds_query
    # TODO: your code here
    #return an array
    # array contains all seeds for that House
    plants = self.plants.includes(:seeds)
    seeds = []

    plants.each do |plant|
      seeds << plant.seeds
    end

    seeds
  end
end
