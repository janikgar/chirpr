module ChirpsHelper
	def get_tagged(chirp)
		message_arr = Array.new
		message_arr = chirp.message.split
		puts message_arr

		message_arr.each_with_index do |word, index|
			# TODO: Regexp to take out puncutation in our hashtags
		  # word = word.
		  if word[0] == "#"
		  	chopped_word = hashtag_chop(word)
		  	naked_word = chopped_word[:naked_hashtag]
		  	punctuation_word = chopped_word[:punctuation]
		  	hashless_word = naked_word[1..-1]
		    if Tag.pluck(:phrase).include?(naked_word.downcase)
		      tag = Tag.find_by(phrase: naked_word.downcase)
		    else
		      tag = Tag.create(phrase: naked_word.downcase)
		    end
		    chirp_tag = ChirpTag.create(chirp_id: chirp.id, tag_id: tag.id)
		    message_arr[index] = "<a href='/chirp_tags?phrase=#{hashless_word}''>#{naked_word}</a>#{punctuation_word}"
		  end
		end

		chirp.message = message_arr.join(" ")
		return chirp
	end
	def hashtag_chop(hashtag)
		# takes out end puncutation from the hashtags
		punctuation = ""
		while hashtag[-1].match(/[[:punct:]]/)
			punctuation += hashtag[-1]
			hashtag = hashtag[0..-2]
		end
		return {naked_hashtag: hashtag, punctuation: punctuation}
	end
end
