class Btc < ApplicationRecord
	mount_uploader :image, QrUploader
	validates :address, presence: true
	validates :image, presence: true
end
