
      delete
    from "integrationtests".test_normalization."nested_stream_with_complex_columns_resulting_into_long_names_partition"
    where (_airbyte_ab_id) in (
        select (_airbyte_ab_id)
        from "nested_stream_with_complex_columns_resulti__dbt_tmp"
    );

    insert into "integrationtests".test_normalization."nested_stream_with_complex_columns_resulting_into_long_names_partition" ("_airbyte_nested_stream_with_complex_columns_resulting_into_long_names_hashid", "double_array_data", "data", "_airbyte_ab_id", "_airbyte_emitted_at", "_airbyte_normalized_at", "_airbyte_partition_hashid")
    (
       select "_airbyte_nested_stream_with_complex_columns_resulting_into_long_names_hashid", "double_array_data", "data", "_airbyte_ab_id", "_airbyte_emitted_at", "_airbyte_normalized_at", "_airbyte_partition_hashid"
       from "nested_stream_with_complex_columns_resulti__dbt_tmp"
    );
  