# Measure Basics

Measures in Looker represent aggregate calculations (i.e. multi-row calculations) like `SUM`, `COUNT`, and `MAX`. They provide information about the groups of data your users have selected with dimensions.<br /><br />



## Anatomy of a Basic Measure

All measures need at least a name, a type, and most of the time a SQL definition.  For example, the <a href="https://learn2.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> view file has a measure called `total_sale_price` inside of it:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
measure: total_sale_price {
  type: sum
  sql: ${sale_price} ;;
}
```

If we break this down:

+ The first row `measure: total_sale_price {` creates a measure with the name of `total_sale_price`.

+ The second row `type: sum` gives the measure a type. All of the possible types are defined on our [Measure Types](https://looker.com/docs/reference/field-reference/measure-type-reference) docs page, but we'll also go over them in the [next lesson](https://learn2.looker.com/projects/e-commerce/files/9_measure_types.md).

+ The third row `sql: ${sale_price} ;;` defines what will be included in the sum.

+ The last row `}` closes the dimension.<br /><br />



## Try it Yourself

The `products` view has a dimension called `cost`. Try adding a `total_cost` measure that adds up the total cost.

[See the Answer](https://learn2.looker.com/projects/e-commerce/files/z_answers.md#dimension-basics)<br /><br />



## Next Step

Next, we'll look at examples of most of the available measure types.

<div style="float:left;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/7_dimension_groups.md">&#10094; Dimension Groups</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/9_measure_types.md">Measure Types &#10095;</a>
</div>
