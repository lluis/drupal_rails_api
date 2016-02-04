class EventSerializer < ActiveModel::Serializer
  attributes Event::DRUPAL_RAILS.values.collect {|hash| hash.values }.flatten
end
