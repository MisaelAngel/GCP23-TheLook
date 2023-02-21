view: pdt {
  derived_table: {
    datagroup_trigger: some_datagroup
    create_process: {
      sql_step: CREATE TABLE ${SQL_TABLE_NAME} (
                         customer_id int(11) PRIMARY KEY,
                         lifetime_orders int(11)
                       ) ;;
      sql_step: INSERT INTO ${SQL_TABLE_NAME}(customer_id, lifetime_orders)
                        SELECT customer_id, COUNT(*) AS lifetime_orders
                         FROM order
                         GROUP BY customer_id ;;
    }
  }
}
