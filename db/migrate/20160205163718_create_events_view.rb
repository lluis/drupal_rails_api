class CreateEventsView < ActiveRecord::Migration[5.0]

  def up
    execute <<-SQL
      CREATE VIEW events AS
        SELECT node.nid AS id,
               node.title AS title,
               field_data_body.body_value AS description,
               field_data_field_data.field_data_value AS date
        FROM "node"
        JOIN field_data_body ON field_data_body.entity_id=node.nid
        JOIN field_data_field_data ON field_data_field_data.entity_id=node.nid
        WHERE type='activitat'
          AND field_data_field_data.field_data_rrule is null
    SQL
  end

  def down
    execute "DROP VIEW events"
  end

end
