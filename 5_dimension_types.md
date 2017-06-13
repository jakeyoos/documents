# Dimension Types

Dimensions have many different types. In this lesson we'll look at examples of all these types and briefly talk about when to use them. For more complete documentation about types, check out our [Dimension and Filter Types](https://looker.com/docs/reference/field-reference/dimension-type-reference) page.<br /><br />

#### String

The `string` type should be used with data that includes words or letters. It is the default dimension type.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
dimension: first_name {
  type: string
  sql: ${TABLE}.first_name ;;
}
```

<span style="border:1px solid rgb(87,190,190);border-radius:5px;padding:5px;background-color:rgb(213,239,238);"><a style="color:rgb(87,190,190);font-size:12px;" href="https://learn2.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a></span> <span style="border:1px solid rgb(32,165,222);border-radius:5px;padding:5px;background-color:rgb(199,232,247);"><a style="color:rgb(32,165,222);font-size:12px;" href="https://looker.com/docs/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a></span><br /><br />

#### Number

The `number` type should be used with number data.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
dimension: sale_price {
  type: number
  sql: ${TABLE}.sale_price ;;
}
```

<span style="border:1px solid rgb(87,190,190);border-radius:5px;padding:5px;"><a style="color:rgb(87,190,190);font-size:12px;" href="https://learn2.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a></span> <span style="border:1px solid rgb(32,165,222);border-radius:5px;padding:5px;"><a style="color:rgb(32,165,222);font-size:12px;" href="https://looker.com/docs/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a></span><br /><br />

Read `type: number` documentation [here](https://looker.com/docs/reference/field-reference/dimension-type-reference#number).<br /><br />

#### YesNo

The `yesno` type allows you to set a condition, then the field will return "Yes" if that condition is true, and "No" if it is not true.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> View File</a>
</div>
```
dimension: is_complete {
  type: yesno
  sql: ${status} = 'complete' ;;
}
```

<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn2.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://looker.com/docs/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a><br /><br />

You'll see that we've put a statement that will evaluate to true or false in the `sql` parameter. This is required for `yesno` dimensions.

Read `type: yesno` documentation [here](https://looker.com/docs/reference/field-reference/dimension-type-reference#yesno).<br /><br />

#### Tier

The `tier` type allows you to set various number ranges, then bucket data into those ranges. You can also choose what style will be used to display those ranges to users.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
dimension: age_tier {
  type: tier
  tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80]
  style: integer
  sql: ${age} ;;
}
```

You'll see that there are 2 new parameters required for `tier` dimensions. The `tiers` parameter defines the number ranges you're interested in. The `style` parameter defines how the tiers will be displayed to users; you can see the available styles [in our documentation](https://looker.com/docs/reference/field-reference/dimension-type-reference#style).

Read `type: tier` documentation [here](https://looker.com/docs/reference/field-reference/dimension-type-reference#tier).<br /><br />

#### Location

The `location` type allows you to create a location field, based on a latitude and longitude. This is useful when you need to map things in Looker, or calculate distances between items.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/distribution_center.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">distribution_center</a> View File</a>
</div>
```
dimension: location {
  type: location
  sql_latitude: ${latitude} ;;
  sql_longitude: ${longitude} ;;
}
```

You'll see that there are 2 new parameters required for `location` dimensions. The `sql_latitude` parameter defines the latitude of the location. The `sql_longitude` parameter defines the longitude of the location.

Read `type: location` documentation [here](https://looker.com/docs/reference/field-reference/dimension-type-reference#location).<br /><br />

#### Distance

The `distance` type allows you to calculate the distance between two `type: location` dimensions.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
dimension: distance_from_distribution_center {
  type: distance
  start_location_field: distribution_center.location
  end_location_field: users.location
  units: miles
}
```

You'll see that there are 3 new parameters required for `distance` dimensions. The `start_location_field` parameter defines the first location. The `end_location_field` parameter defines the second location. The `units` field defines the distance units you'd like to be used; you can see the available units [in our documentation](https://looker.com/docs/reference/field-reference/dimension-type-reference#distance).

Read `type: distance` documentation [here](https://looker.com/docs/reference/field-reference/dimension-type-reference#distance).<br /><br />

#### Zipcode

The `zipcode` type should be used with 5 digit, US zipcode data.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
dimension: zip {
  type: zipcode
  sql: ${TABLE}.zipcode ;;
}
```

Read `type: zipcode` documentation [here](https://looker.com/docs/reference/field-reference/dimension-type-reference#zipcode).<br /><br />



## Next Step

Next, we'll look at examples of all the available dimension types.

<div style="float:left;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/1_lookml_basics.md">&#10094; Dimension Basics</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/3_dimension_types.md">Other Dimension Settings &#10095;</a>
</div>
