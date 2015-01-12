module CharactersHelper
	def image_placeholder options={style: 'width:100%; height: 100%'}
		image_tag('portrait.jpg', style: options[:style], class: options[:class] )
	end
end
