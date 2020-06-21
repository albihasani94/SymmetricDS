------------------------------------------------------------------------------
-- Symmetric Configuration
------------------------------------------------------------------------------

insert into sym_channel
(channel_id, processing_order, max_batch_size, enabled, description)
values('course', 1, 100000, 1, 'course data from postgres heroku instance to postgres local instance');

insert into sym_channel
(channel_id, processing_order, max_batch_size, enabled, description)
values('human', 1, 100000, 1, 'human data from postgres heroku instance to postgres local instance');

-- insert into sym_node_group (node_group_id)
-- values ('heroku');
insert into sym_node_group (node_group_id)
values ('postgres');

insert into sym_node_group_link (source_node_group_id, target_node_group_id, data_event_action)
values ('heroku', 'postgres', 'P');

-- insert into sym_node_group_link (source_node_group_id, target_node_group_id, data_event_action)
-- values ('postgres', 'heroku', 'W');

insert into sym_trigger
(trigger_id,source_table_name,channel_id, sync_on_delete, last_update_time,create_time)
values('course','course','course', 0, current_timestamp,current_timestamp);

insert into sym_trigger
(trigger_id,source_table_name,channel_id, sync_on_delete, last_update_time,create_time)
values('human','human','human', 0, current_timestamp,current_timestamp);

insert into sym_router
(router_id,source_node_group_id,target_node_group_id,router_type,create_time,last_update_time)
values('heroku_2_postgres', 'heroku', 'postgres', 'default',current_timestamp, current_timestamp);

insert into sym_trigger_router
(trigger_id,router_id,initial_load_order,last_update_time,create_time)
values('course','heroku_2_postgres', 200, current_timestamp, current_timestamp);

insert into sym_trigger_router
(trigger_id,router_id,initial_load_order,last_update_time,create_time)
values('human','heroku_2_postgres', 200, current_timestamp, current_timestamp);
