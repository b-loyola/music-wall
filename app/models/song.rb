class Song < ActiveRecord::Base
	belongs_to :user
	has_many :votes

	validates :title, presence: true
	validates :author, presence: true
	validates :url, allow_blank: true, format: {with: /https?:\/\/[\S]+/}
	before_save :nullify_url, if: :url

	def nullify_url
		self.url = nil if url.empty?
	end

	def youtube_embed
	  url[/www\.youtube\.com\/watch\?v\=(\w+)/, 1]
	end

end