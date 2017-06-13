# Views

As mentioned in the [LookML Basics](https://learn2.looker.com/projects/e-commerce/files/1_lookml_basics.md) lesson, a **view** in Looker corresponds to a table in your database. You can also create your own database tables with Looker, and turn that into a view, but we'll cover that feature in the [next lesson](https://learn2.looker.com/projects/e-commerce/files/3_derived_tables.md).<br /><br />



## Anatomy of a Basic View

Basic views are simple to define in LookML, and only require 1 or 2 parameters. For example, the top of the <a href="https://learn2.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> view file looks like this:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> View File</a>
</div>
```
view: orders {
  sql_table_name: public.orders ;;
```

If we break this down:

+ The first row `view: orders {` creates a view with the name of `orders`.

+ The second row `sql_table_name: public.orders ;;` tells Looker which database table to associate with this view.

  When you setup a database connection in Looker you define a default schema (a.k.a. a "database" in MySQL). If that's the schema you want, and you name the view with exactly the same name as its table, you don't even need to add the `sql_table_name` parameter.

  Also note that the row ends with `;;`. This is how Looker knows you're done writing the table name, and is the way all SQL-type parameters are ended in Looker.

You'll notice there are a lot of other dimensions and measures within the <a href="https://learn2.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> view, but we'll discuss those separately in our <a href="https://learn2.looker.com/projects/e-commerce/files/3_dimension_basics.md">dimension</a> and measures lessons.

<span style="border:1px solid rgb(234,138,47);border-radius:5px;padding:5px;background-color:rgb(249,238,227);"><a style="color:rgb(234,138,47);font-size:12px;" href="https://learn2.looker.com/explore/e_commerce/orders" target="_blank"><i class="fa fa-search"></i> Explore the Orders View</a></span><br /><br /><br />



## Other View Settings

All of the additional view level settings that you can apply in LookML can be found on our [View Parameters](https://looker.com/docs/reference/view-reference) docs page.<br /><br />



## Next Step

Next, we'll look at creating your own database tables within Looker.

<div style="float:left;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/1_lookml_basics.md">&#10094; LookML Basics</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/3_derived_tables.md">Dimension Basics &#10095;</a>
</div>
