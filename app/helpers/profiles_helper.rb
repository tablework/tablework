module ProfilesHelper
	def ImagePreviewer(user)
		if user.image
			image_tag(user.image, class: 'profile-editor-preview')
		end
	end
end
