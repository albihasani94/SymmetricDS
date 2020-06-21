------------------------------------------------------------------------------
-- Sample Symmetric Configuration
------------------------------------------------------------------------------

insert into sym_channel 
(channel_id, processing_order, max_batch_size, enabled, description)
values('book', 1, 100000, 1, 'book data from heroku to postgres 215');

-- insert into sym_node_group (node_group_id) values ('heroku');
insert into sym_node_group (node_group_id) values ('postgres');

insert into sym_node_group_link (source_node_group_id, target_node_group_id, data_event_action) values ('heroku', 'postgres', 'P');

insert into sym_trigger 
(trigger_id,source_table_name,channel_id, sync_on_delete, last_update_time,create_time)
values('book','book','book', 0, current_timestamp,current_timestamp);

insert into sym_router 
(router_id,source_node_group_id,target_node_group_id,router_type,create_time,last_update_time)
values('heroku_2_postgres', 'heroku', 'postgres', 'default',current_timestamp, current_timestamp);

insert into sym_trigger_router 
(trigger_id,router_id,initial_load_order,last_update_time,create_time)
values('book','heroku_2_postgres', 100, current_timestamp, current_timestamp);

-- insert into sym_node (node_id,node_group_id,external_id,sync_enabled,sync_url,schema_version,symmetric_version,database_type,database_version,heartbeat_time,timezone_offset,batch_to_send_count,batch_in_error_count,created_at_node_id) 
-- values ('00','heroku','00',1,null,null,null,null,null,current_timestamp,null,0,0,'000');
-- insert into sym_node (node_id,node_group_id,external_id,sync_enabled,sync_url,schema_version,symmetric_version,database_type,database_version,heartbeat_time,timezone_offset,batch_to_send_count,batch_in_error_count,created_at_node_id) 
-- values ('01','postgres','01',1,null,null,null,null,null,current_timestamp,null,0,0,'000');

-- insert into sym_node_identity values ('00');
-- insert into sym_node_identity values ('01');