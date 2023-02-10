# If necessary, uncomment the line below to include explore_source.
# include: "mtrmisathelook.model.lkml"

view: ndt_test {
  derived_table: {
    explore_source: order_items {
      column: id {}
      column: order_id {}
      column: sale_price {}
    }
    datagroup_trigger: mtrmisathelook_default_datagroup
    indexes: ["id"]
  }
  dimension: id {
    description: ""
    type: number
    primary_key: yes
  }
  dimension: order_id {
    description: ""
    type: number
  }
  dimension: sale_price {
    description: ""
    type: number
  }
}
# If necessary, uncomment the line below to include explore_source.
# include: "mtrmisathelook.model.lkml"

view: ndt_test_2 {
  derived_table: {
    explore_source: order_items {
      column: id2 {field: users.id}
      column: order_id2 {field: order_items.order_id}
      column: sale_price2 {field: order_items.sale_price}
    }
  }
  dimension: id2 {
    description: ""
    type: number
    primary_key: yes
  }
  dimension: order_id2 {
    description: ""
    type: number
  }
  dimension: sale_price2 {
    description: ""
    type: number
  }
}
