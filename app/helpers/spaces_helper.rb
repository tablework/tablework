module SpacesHelper
  def icon_helper name
    case name
      when 'Politic'
        return 'building'
      when 'Economic'
        return 'university'
      when 'Culture'
        return 'users'
      when 'Fashion'
        return 'child'
      when 'Geography'
        return 'world'
      when 'Law'
        return 'legal'
      else
        return nil
    end
  end
end