module CharactersHelper
	def user_portrait options={style: 'width:100%; height: 100%'}
		if options[:user]
			user_use_uploaded_images(options)
		elsif options[:gender] == 'male' or options[:gender] == 'female'
			image_tag( options[:gender]+'.jpeg', style: options[:style], class: options[:class] )
		else
			image_tag('portrait.jpg', style: options[:style], class: options[:class] )	
		end
	end

	def user_use_uploaded_images(options)
		if options[:user].image.present?
				image_tag options[:user].image.url
	    elsif options[:user].profile_photo
	    	  	image_tag options[:user].profile_photo
		elsif options[:user].instance_of?(User) && 
			  options[:gender] == 'male' or options[:gender] == 'female'
		  		image_tag( options[:gender]+'.jpeg', style: options[:style], class: options[:class] )
		end
	end
end
