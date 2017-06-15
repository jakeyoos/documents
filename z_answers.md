# "Try It Yourself" Answers

This page includes the answers to all of the **Try it Yourself** questions throughout this tutorial.

<a name="dimension-basics"></a>

### Dimension Basics

*Question*

The `orders` table in our dataset has a column called `traffic_source` that hasn't yet been added in LookML. Try adding it using the information you've learned.

*Answer*

Add the following dimension to the <a href="https://learn2.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> view file

```
dimension: traffic_source {
  type: string
  sql: ${TABLE}.traffic_source ;;
}
```

*Try It*

After adding this dimension, [explore the orders view](https://learn2.looker.com/explore/e_commerce/orders) to see it in action.
