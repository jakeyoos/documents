# "Try It Yourself" Answers

This page includes the answers to all of the **Try it Yourself** questions throughout this tutorial.<br /><br />



<a name="dimension-basics"></a>

### Dimension Basics

*Question*

The `orders` table in our dataset has a column called `traffic_source` that hasn't yet been added in LookML. Try adding it using the information you've learned.

*Answer*

Add the following dimension to the <a href="https://learn2.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> view file:

```
dimension: traffic_source {
  type: string
  sql: ${TABLE}.traffic_source ;;
}
```

*Try It*

After adding this dimension, [explore the orders view](https://learn2.looker.com/explore/e_commerce/orders) to see it in action.<br /><br />



<a name="dimension-basics"></a>

### Measure Basics

*Question*

The `products` view has a dimension called `retail_price`. Try adding a `total_retail_price` measure that adds up the total price.

*Answer*

Add the following dimension to the <a href="https://learn2.looker.com/projects/e-commerce/files/products.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">products</a> view file:

```
dimension: total_retail_price {
  type: sum
  sql: ${retail_price} ;;
}
```

*Try It*

After adding this dimension, [explore the products view](https://learn2.looker.com/explore/e_commerce/products) to see it in action.<br /><br />



<a name="explore-basics"></a>

### Explore Basics

*Question*

Try adding as many joins as possible to the `products` explore.

*Answer*

Add the following joins to the `products` explore in the <a href="https://learn2.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> model file:

```
explore: products {
  join: inventory_items {
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join:  distribution_centers {
    sql_on: ${distribution_centers.id} = ${inventory_items.product_distribution_center_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: order_items {
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    type: left_outer
    relationship: one_to_one
  }

  join: orders {
    sql_on: ${orders.id} = ${order_items.order_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: users {
    sql_on: ${users.id} = ${orders.user_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: user_order_facts {
    sql_on: ${user_order_facts.user_id} = ${users.id} ;;
    type: left_outer
    relationship: one_to_one
  }
}
```

*Try It*

After adding these joins, [explore the products explore](https://learn2.looker.com/explore/e_commerce/products) to see it in action.
