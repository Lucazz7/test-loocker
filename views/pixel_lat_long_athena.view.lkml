view: pixel_lat_long_athena {
  derived_table: {
    sql: select distinct ST_X(lat_lon) as ln, ST_Y(lat_lon) as lat, source_id   from pixel where created_timestamp > '2022-10-12'  and created_timestamp < '2022-10-13'
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ln {
    type: number
    sql: ${TABLE}.ln ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: centroid {
    type: location
    sql_latitude: ${TABLE}.lat ;;
    sql_longitude:${TABLE}.ln  ;;
  }

  dimension: source_id {
    type: string
    sql: ${TABLE}.source_id ;;
  }

  set: detail {
    fields: [ln, lat, source_id]
  }
}
