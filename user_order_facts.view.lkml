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
  }
}
