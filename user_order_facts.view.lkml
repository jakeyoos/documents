view: user_order_facts {
  derived_table: {
    sql:
      SELECT
        user_id,
        MIN(DATE(created_at)) AS first_order_date
      FROM
        users
      GROUP BY
        customer_id ;;
    persist_for: "24 hours"
    distribution_style: all
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    primary_key: yes
    hidden: yes
  }

  dimension: first_order_date {
    type: date
    sql: ${TABLE}.first_order_date ;;
  }
}
