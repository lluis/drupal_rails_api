class Event < ApplicationRecord
  self.table_name='node'
  self.inheritance_column='type_rails'

  DRUPAL_RAILS = {
    node: {
      nid:   :nid, # with id doesn't work
      title: :title,
    },
    field_data_body: {
      body_value: :description,
    },
    field_data_field_data: {
      field_data_value: :date,
    }
  }

  def self.default_scope
    # select drupal_name AS rails_name, ...
    select_str = ""
    # join tables
    joins_str =  "JOIN field_data_body"
    joins_str << " ON field_data_body.entity_id=node.nid"
    joins_str << " JOIN field_data_field_data"
    joins_str << " ON field_data_field_data.entity_id=node.nid"
    # filter results
    where_str = "type='activitat'"

    DRUPAL_RAILS.each do |table, mapping|
      mapping.each do |drupal_name, rails_name|
        select_str << "#{table}.#{drupal_name} AS #{rails_name},"
      end
    end
    select_str.chomp!(',')
    select(select_str).
      joins(joins_str).
      where(where_str)
  end

end
