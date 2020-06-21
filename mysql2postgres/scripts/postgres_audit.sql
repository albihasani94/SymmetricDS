insert into sym_channel (channel_id, processing_order, max_batch_size, enabled, description)
values('audit', 1, 100000, 1, 'Audit Channel');

insert into sym_node_group(node_group_id, description) values('local', 'Node group for local node');

insert into sym_node_group_link(source_node_group_id, target_node_group_id, data_event_action) values ('postgres', 'local', 'R');

insert into sym_trigger (trigger_id,source_table_name,channel_id, sync_on_incoming_batch, last_update_time,create_time)
values('book-audit','book','audit', 1, current_timestamp,current_timestamp);

insert into sym_router 
(router_id,source_node_group_id,target_node_group_id,router_type,create_time,last_update_time)
values('postgres-audit', 'postgres', 'local', 'audit',current_timestamp, current_timestamp);

insert into sym_trigger_router 
(trigger_id,router_id,initial_load_order,last_update_time,create_time)
values('book-audit','postgres-audit', 100, current_timestamp, current_timestamp);