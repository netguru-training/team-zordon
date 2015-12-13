# decorator to habit model
class HabitDecorator < Draper::Decorator
  delegate_all

  def name_days
    object.days.map { |day| Date::DAYNAMES[day] }
  end

  def inline_name_days
    name_days.join(' ')
  end

  def active_name
    object.active ? h.t('active.truthy') : h.t('active.falsy')
  end

end
