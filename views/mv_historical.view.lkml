# The name of this view in Looker is "Mv Historical"
view: mv_historical {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `athena.mv_historical`
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
  # This dimension will be called "Data Inst" in Explore.

  dimension: data_inst {
    type: string
    sql: ${TABLE}.data_inst ;;
  }

  dimension: data_max {
    type: string
    sql: ${TABLE}.data_max ;;
  }

  dimension: data_min {
    type: string
    sql: ${TABLE}.data_min ;;
  }

  dimension_group: data_timestamp {
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
    sql: ${TABLE}.data_timestamp ;;
  }

  dimension: datatype_id {
    type: number
    sql: ${TABLE}.datatype_id ;;
  }

  dimension: source_id {
    type: string
    sql: ${TABLE}.source_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: temp {
  derived_table: {
    sql: SELECT case datatype_id when 3 then "Pressão Atmosferica" when 7 then "Velocidade Vento" when 1 then "Temperatura" when 2 then "Humidade" when 6 then "Chuva" when 5 then "Radiação Solar" else cast(datatype_id as string) end as Sensores,
      sum (cast(data_min as BIGNUMERIC) ) as Medicao
      --data_inst, data_max,  EXTRACT(DAY FROM data_timestamp AT TIME ZONE "UTC") AS the_day_utc
      FROM `athena-accept.athena.mv_historical` WHERE created_timestamp > '2022-10-03'  and source_id = "A298934"
      group by 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sensores {
    type: string
    sql: ${TABLE}.Sensores ;;
  }

  dimension: medicao {
    type: number
    sql: ${TABLE}.Medicao ;;
  }

  set: detail {
    fields: [sensores, medicao]
  }
}
