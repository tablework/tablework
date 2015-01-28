module ProfilesHelper
	def ImagePreviewer(user)
		imageUrl = 'portrait.jpg'
		#{Rails.root}/tmp/uploads
		if user.image.url
			imageUrl = user.image
		elsif user.profile_photo
			imageUrl = user.profile_photo
		end
		image_tag(imageUrl, class: 'profile-editor-preview')
	end
end


