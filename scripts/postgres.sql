insert into sym_channel 
(channel_id, processing_order, max_batch_size, enabled, description)
values('book_postgres', 1, 100000, 1, 'book data from postgres to mysql local');

-- insert into sym_node_group (node_group_id) values ('heroku');
insert into sym_node_group (node_group_id) values ('mysql');

insert into sym_node_group_link (source_node_group_id, target_node_group_id, data_event_action) values ('postgres', 'mysql', 'P');

insert into sym_trigger 
(trigger_id,source_table_name,channel_id,last_update_time,create_time)
values('book_postgres','book','book_postgres',current_timestamp,current_timestamp);

insert into sym_router 
(router_id,source_node_group_id,target_node_group_id,router_type,create_time,last_update_time)
values('postgres_2_mysql', 'postgres', 'mysql', 'default',current_timestamp, current_timestamp);

insert into sym_trigger_router 
(trigger_id,router_id,initial_load_order,last_update_time,create_time)
values('book_postgres','postgres_2_mysql', 100, current_timestamp, current_timestamp);