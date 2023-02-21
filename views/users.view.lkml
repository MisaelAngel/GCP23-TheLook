view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    tags: ["test_tag"]
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    # sql: ${TABLE}.state ;;
    # link: {
    #   label: "Filter by"
    # }
    sql: concat("Backslash \\ ",${TABLE}.state, "'s") ;;
    # sql: concat("Backslash \&#92; ",${TABLE}.state, "'s") ;;
    # html: <p>{{value}}</p> ;;
  }

  dimension: backslash_state {
    type: string
    sql: ${state} ;;
    html: <p>{{filterable_value}}</p> ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: state_list {
    type: list
    list_field: state
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    html: {% if users.gender._value == "m" %}
            <p style="color:#FF0000";>{{rendered_value}}</p>
          {%endif%};;
  }

  measure: test {
    type: number
    sql: ${age} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      saralooker.count,
      sindhu.count,
      user_data.count
    ]
  }
}
