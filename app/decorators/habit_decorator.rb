# decorator to habit model
class HabitDecorator < Draper::Decorator
  delegate_all

  def name_days
    object.days.map { |day| Date::DAYNAMES[day] }
  end

  def active_name
    object.active ? h.t('active.truthy') : h.t('active.falsy')
  end

end
