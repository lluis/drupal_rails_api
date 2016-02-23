class CreateEventsView < ActiveRecord::Migration[5.0]

  def up
    execute <<-SQL
      CREATE VIEW events AS
        SELECT node.nid AS id,
               node.title AS title,
               field_data_body.body_value AS description,
               field_data_field_data.field_data_value AS date,
               file_managed.uri as image
        FROM "node"
        JOIN field_data_body ON field_data_body.entity_id=node.nid
        JOIN field_data_field_data ON field_data_field_data.entity_id=node.nid
        JOIN file_usage ON file_usage.id=node.nid
             AND file_usage.type='node'
             AND file_usage.module='file'
        JOIN file_managed ON file_managed.fid=file_usage.fid
        WHERE node.type='activitat'
          AND field_data_field_data.field_data_rrule is null
          AND node.status=1
    SQL
  end

  def down
    execute "DROP VIEW events"
  end

end
