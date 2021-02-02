require 'csv'

class Submission < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_one_attached :image

  validates :name, presence: false, length: { maximum: 255 }
  validates :image, presence: true. blob: { content_type: :image, size_range: 0..10.megabytes }

  #validates :breed, presence: true

  def self.to_csv
    attributes = %w[id name breed]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each { |contact| csv << attributes.map { |attr| contact.send(attr) } }
    end
  end
end
