# Explore Basics

An **explore** is how you expose a **view** into the Explore menu. However, it is also used to combine together multiple views, which is critical for unlocking the full power of Looker.<br /><br />



## Anatomy of a Basic Explore

Although you can give explores arbitrary names by using the correct set of LookML parameters, usually you need to name an explore with the name of a view. For example, the <a href="https://learn2.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> model file has an explore called `product` inside of it:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> Model File</a>
</div>
```
explore: products { }
```

We've defined a view called "products" in the <a href="https://learn2.looker.com/projects/e-commerce/files/products.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">products</a> view file, and created an explore from it. This is not a particularly interesting explore, but it does expose the "products" view into the Explore menu.<br /><br />



## Joining Multiple Views in the Same Explore

As we've seen, views are similar to SQL tables. Just as you can join tables together in SQL, you can join views together within an explore. Let's look at the more complex and more typical explore "order_items" explore:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> Model File</a>
</div>
```
explore: order_items {
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

  join: inventory_items {
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
    type: left_outer
    relationship: one_to_one
  }

  join: products {
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join:  distribution_centers {
    sql_on: ${distribution_centers.id} = ${products.distribution_center_id} ;;
    type: left_outer
    relationship: many_to_one
  }
}
```

To break down just the first few rows:

+ The first row `explore: order_items {` creates an explore based on the `order_items` view.

+ The second row `join: orders {` joins the `orders` view into the `order_items` view

+ The third row `sql_on: ${orders.id} = ${order_items.order_id} ;;` established the join condition between the `order_items` and `orders` view. Notice we can use the `${view_name.field_name}` references that we learned about in the dimensions lesson.

+ The fourth row `type: left_outer` defines the join as a `LEFT JOIN`. The `left_outer` value is the default value, so this row could be excluded if you like. Using a `LEFT JOIN` is *almost* always the right decision, because it allows users to see all the data from `order_items`, even if there is no corresponding data in the joined views.

+ The fourth row `relationship: many_to_one` establishes the relationship between the joined views. In this case we're saying there are potentially many order items for one order.

+ The last row `}` closes the join.

The other joins work in the same way. If you use SQL a lot, it might be helpful for you to see how the LookML above would be translated into SQL. The corresponding SQL would be:

```
SELECT ...
FROM order_items

LEFT JOIN orders
ON orders.id = order_items.order_id

LEFT JOIN users
ON users.id = orders.user_id

LEFT JOIN inventory_items
ON inventory_items.id = order_items.inventory_item_id

LEFT JOIN products
ON products.id = inventory_items.product_id

LEFT JOIN distribution_centers
ON distribution_centers.id = products.distribution_center_id
```

#### Properly Defining the Relationship

Properly defining the `relationship` parameter in Looker is critical to the proper functioning of your model. If you properly define the relationships, Looker can prevent the problems of fanouts and double-counting certain records. If you're not familiar with "fanouts", you can read about them in [this blog post](https://looker.com/blog/aggregate-functions-gone-bad-and-the-joins-who-made-them-that-way).

When a view is joined directly to an explore, like the `orders` view in the example above, the relationship is *from* the explore *to* the joined view. We're saying here that there could be many order items for one order.

When a view is joined to an explore through another view - such as how `users` joins through `orders` to `order_items` in this example - the relationship being defined is from the intermediate view (`orders`) to the final view (`users`). In this example we're saying there could be many orders for one user.

As mentioned in the dimension options lesson, another critical step to keeping things functioning properly is to define a primary key for each view.<br /><br />



## Try it Yourself

Try creating an explore that starts from `users`, and join as many views to it as possible.

[See the Answer](https://learn2.looker.com/projects/e-commerce/files/z_answers.md#dimension-basics)<br /><br />



## Next Step

Next, we'll look at examples of all the available dimension types.

<div style="float:left;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/1_lookml_basics.md">&#10094; LookML Basics</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/3_dimension_types.md">Dimension Types &#10095;</a>
</div>
