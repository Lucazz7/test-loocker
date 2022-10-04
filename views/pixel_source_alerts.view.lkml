# The name of this view in Looker is "Pixel Source Alerts"
view: pixel_source_alerts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `athena.pixel_source_alerts`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_timestamp ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Data" in Explore.

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension: data_owner_id {
    type: number
    sql: ${TABLE}.data_owner_id ;;
  }

  dimension: datatype_id {
    type: number
    sql: ${TABLE}.datatype_id ;;
  }

  dimension: lon_lat {
    type: string
    sql: ${TABLE}.lon_lat ;;
  }

  dimension: source_id {
    type: string
    sql: ${TABLE}.source_id ;;
  }

  dimension: source_subtype_id {
    type: number
    sql: ${TABLE}.source_subtype_id ;;
  }

  dimension_group: source_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.source_timestamp ;;
  }

  dimension: source_type_id {
    type: number
    sql: ${TABLE}.source_type_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
