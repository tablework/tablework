module CharactersHelper
	def image_placeholder options={style: 'width:100%; height: 100%'}
    if options[:gender] == 'male'
      image_tag('male.jpeg', style: options[:style], class: options[:class] )
    elsif options[:gender] == 'female'
      image_tag('female.jpeg', style: options[:style], class: options[:class] )
    else
      image_tag('portrait.jpg', style: options[:style], class: options[:class] )
    end
	end
end
