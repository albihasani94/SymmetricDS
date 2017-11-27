insert into sym_channel (channel_id, processing_order, max_batch_size, enabled, description)
values('audit-mysql', 1, 100000, 1, 'Audit Channel');

insert into sym_trigger (trigger_id,source_table_name,channel_id, sync_on_incoming_batch, last_update_time,create_time)
values('book-audit-mysql','book_audit','audit-mysql', 1, current_timestamp,current_timestamp);

insert into sym_trigger_router 
(trigger_id,router_id,initial_load_order,last_update_time,create_time)
values('book-audit-mysql','postgres_2_mysql', 100, current_timestamp, current_timestamp);