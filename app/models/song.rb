class Song < ActiveRecord::Base
	validates :title, presence: true
	validates :author, presence: true
	validates :url, allow_blank: true, format: {with: /https?:\/\/[\S]+/}
	before_save :nullify_url, if: :url

	def nullify_url
		self.url = nil if url.empty?
	end

end