create index idx_alias_id on alias(alias_id);

create index idx_property_id on property(property_id);

CREATE INDEX idx_alias_id_2 ON classified_follow_up_data (Alias_ID);

CREATE INDEX idx_property_id_2 ON classified_follow_up_data (Property_ID);

CREATE INDEX idx_alias_id_3 on follow_up_count(Alias_Id);

CREATE INDEX idx_property_id_3 on follow_up_count(property_Id);