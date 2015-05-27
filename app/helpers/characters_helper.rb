module CharactersHelper
  def user_portrait options={style: 'width:100%; height: 100%'}
    if options[:user]
      user_use_uploaded_images(options)
    else
      image_tag("default-avatar-#{1 + rand(5)}.png", style: options[:style], class: options[:class] )
    end
  end

  def user_use_uploaded_images(options)
    if options[:user].image.present?
      image_tag options[:user].image.url, style: options[:style], class: options[:class]
    elsif options[:user].try(:profile_photo)
        image_tag options[:user].profile_photo, style: options[:style], class: options[:class]
      else
      image_tag("default-avatar-#{1 + rand(5)}.png", style: options[:style], class: options[:class] )
    end
  end

  def user_portrait_url user
    if user
      user_use_uploaded_images_url user
    else
      "default-avatar-#{1 + rand(5)}.png"
    end
  end

  def user_use_uploaded_images_url user
    if user.image.present?
      user.image.url
    elsif user.try(:profile_photo)
      user.profile_photo
    else
      "default-avatar-#{1 + rand(5)}.png"
    end
  end
end
