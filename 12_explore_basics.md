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









## References in the sql Parameter

When you're writing your `sql` parameters, it's important to know about the three types of references you can make:

Pattern | Examples | Definition
--------|----------|-----------
`${TABLE}.field_name` | `${TABLE}.status`<br />`${TABLE}.sale_price` | This pattern automatically replaces the `${TABLE}` variable with the database table that is associated with the view where the dimension lives.
`${field_name}` | `${status}`<br />`${sale_price}` | This pattern references an existing field from within the same view.
`${view_name.field_name}` | `${order.status}`<br />`${order_items.sale_price}` | This pattern references an existing field from a *different* view. Using this pattern does require that you have established the proper joins between views, which we'll discuss a little later.

<br />



## More Complicated Dimensions

Just to see a quick example of the different types of references you can use in the `sql` parameter, and to show a slightly more complicated dimension, take a look at this section from the <a href="https://learn2.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> view file:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
dimension: first_name {
  type: string
  sql: ${TABLE}.first_name ;;
}

dimension: last_name {
  type: string
  sql: ${TABLE}.last_name ;;
}

dimension: full_name {
  type: string
  sql: CONCAT(${first_name}, ' ', ${last_name}) ;;
}
```

Notice that the first name and last name dimensions above use the `${TABLE}.field_name` pattern, while the full name dimension uses the `${field_name}` pattern. The full name dimension also uses the SQL function `CONCAT` to combine the first and last names into a single dimension.<br /><br />



## Try it Yourself

The `orders` table in our dataset has a column called `traffic_source` that hasn't yet been added in LookML. Try adding it using the information you've learned.

[See the Answer](https://learn2.looker.com/projects/e-commerce/files/z_answers.md#dimension-basics)<br /><br />



## Next Step

Next, we'll look at examples of all the available dimension types.

<div style="float:left;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/1_lookml_basics.md">&#10094; LookML Basics</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/3_dimension_types.md">Dimension Types &#10095;</a>
</div>
