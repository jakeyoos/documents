# Measure Types

Measures have many different types. In this lesson we'll look at examples of most of these types and briefly talk about when to use them. For more complete documentation about types, check out our [Measure Types](https://looker.com/docs/reference/field-reference/measure-type-reference) page.<br /><br />

#### Number

The `number` type should be used to combine multiple measures, or when performing math on a measure.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
measure: total_profit {
  type: number
  sql: ${total_sale_price} - ${product.cost} ;;
}
```

<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn2.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://looker.com/docs/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a><br /><br />

#### Count

The `count` type provides a count of items. The count type doesn't need a `sql` parameter. It always provides a count of rows in its view.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> View File</a>
</div>
```
measure: count {
  type: count
}
```

<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn2.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://looker.com/docs/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a><br /><br />

#### Sum

The `sum` type adds together the values provided in the `sql` parameter.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
measure: total_sale_price {
  type: sum
  sql: ${sale_price} ;;
}
```

<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn2.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://looker.com/docs/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a><br /><br />

#### Average

The `average` type averages (finds the mean) of the values provided in the `sql` parameter.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
measure: average_sale_price {
  type: average
  sql: ${sale_price} ;;
}
```

<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn2.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://looker.com/docs/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a><br /><br />

#### Min

The `min` type finds the minimum of the values provided in the `sql` parameter. When used with date or time values, it finds the earliest date or time.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
measure: average_sale_price {
  type: min
  sql: ${sale_price} ;;
}
```

<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn2.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://looker.com/docs/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a><br /><br />

#### Max

The `max` type finds the maximum of the values provided in the `sql` parameter. When used with date or time values, it finds the latest date or time.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
measure: latest_order_date {
  type: max
  sql: ${created_date} ;;
}
```

<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn2.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://looker.com/docs/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a><br /><br />



## Next Step

Next, we'll look at examples of all the available dimension types.

<div style="float:left;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/8_measure_basics.md">&#10094; Measure Basics</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/10_measure_options.md">Other Measure Settings &#10095;</a>
</div>
