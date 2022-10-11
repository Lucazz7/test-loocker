view: relatoriohistoric {
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
