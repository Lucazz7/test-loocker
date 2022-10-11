view: sql_runner_query {
  derived_table: {
    sql: SELECT
          CASE WHEN ST_Y(ST_Centroid(ST_Transform(areas."bounds", 4326))) IS NOT NULL AND ST_X(ST_Centroid(ST_Transform(areas."bounds", 4326))) IS NOT NULL THEN (
      COALESCE(CAST(ST_Y(ST_Centroid(ST_Transform(areas."bounds", 4326))) AS VARCHAR),'') || ',' ||
      COALESCE(CAST(ST_X(ST_Centroid(ST_Transform(areas."bounds", 4326))) AS VARCHAR),'')) ELSE NULL END
       AS "areas.bounds"
      FROM public.areas  AS areas
      JOIN public.mapping_areas as ma on areas.mapping_area_id=ma.id and ma.client_id = 19
      GROUP BY
          1
      ORDER BY
          1
      FETCH NEXT 500 ROWS ONLY
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: areas_bounds {
    type: string
    sql: ${TABLE}."areas.bounds" ;;
  }

  set: detail {
    fields: [areas_bounds]
  }
}
