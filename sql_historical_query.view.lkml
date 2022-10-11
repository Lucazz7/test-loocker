view: sql_historical_query {
  derived_table: {
    sql: WITH sql_runner_query AS (SELECT case datatype_id when 3 then "Pressão Atmosferica" when 7 then "Velocidade Vento" when 1 then "Temperatura" when 2 then "Humidade" when 6 then "Chuva" when 5 then "Radiação Solar" else cast(datatype_id as string) end as Sensores,
      sum (cast(data_min as BIGNUMERIC) ) as Medicao
      --data_inst, data_max,  EXTRACT(DAY FROM data_timestamp AT TIME ZONE "UTC") AS the_day_utc
      FROM `athena-accept.athena.mv_historical` WHERE created_timestamp > '2022-10-03'  and source_id = "A298934"
      group by 1
      )
      SELECT
          sql_runner_query.Medicao AS sql_runner_query_medicao,
          sql_runner_query.Sensores AS sql_runner_query_sensores
      FROM sql_runner_query
      GROUP BY
          1,
          2
      ORDER BY
          1
      LIMIT 5000
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sql_runner_query_medicao {
    type: number
    sql: ${TABLE}.sql_runner_query_medicao ;;
  }

  dimension: sql_runner_query_sensores {
    type: string
    sql: ${TABLE}.sql_runner_query_sensores ;;
  }

  set: detail {
    fields: [sql_runner_query_medicao, sql_runner_query_sensores]
  }
}
