# Dimension Groups

Dimension groups allow you to create multiple time-based dimensions at the same time, based on a time column in your database. Currently, there are no other use of dimension groups.

It is possible to create individual time-based dimensions, though the normal pattern in Looker is to use a dimension group.<br /><br />



## Anatomy of a Dimension Group

All dimension groups require a type of time, the list of timeframes to be generated, and a SQL definition.  Dimension groups assume you're providing a datetime, but if you have another type of time information, you can specify that with the `datatype` parameter.

For example, the <a href="https://learn2.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> view file has a dimension group called `created` inside of it:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> View File</a>
</div>
```
dimension_group: created {
  type: time
  datatype: datetime
  timeframes: [
    raw,
    time,
    date,
    week,
    month,
    quarter,
    year
  ]
  sql: ${TABLE}.created_at ;;
}
```

If we break this down:

+ The first row `dimension_group: created {` creates a dimension group with the name of `created` (more on naming below).

+ The second row `type: time` is required for all dimension groups.

+ The third row `datatype: datetime` specifies what type of time information you'll be providing in the `sql` parameter. All of the supported data types are listed on the <a href="https://looker.com/docs/reference/field-params/dimension_group" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">dimension_group</a> docs page. In this case this row could be omitted, since "datetime" is the default value.

+ The fourth row `timeframes: [` starts a list of timeframes that we want to be generated. All of the possible timeframes are defined on our <a href="https://looker.com/docs/reference/field-params/dimension_group" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">dimension_group</a> docs page.

+ The thirteenth row `sql: ${TABLE}.created_at ;;` defines the underlying time information that should be used.

+ The last row `}` closes the dimension.<br /><br />



## Dimension Group Referencing and Naming

Dimension groups create a set of dimensions that are named by combining the dimension group name and the timeframe. For example, in the "created" dimension group above, the following dimensions would be created:

+ created_raw
+ created_time
+ created_date
+ created_week
+ created_month
+ created_quarter
+ created_year

If you wanted to reference these dimensions, you would need to use `${created_time}`, `${created_date}`, etc. If you simply used `${created}` Looker will generate an error.<br /><br />



## Creating Individual Time Dimensions

You can create individual, time-based dimensions if you like. You'll just need to know the `type:` that you want to use, which you'll find listed on our [Dimension and Filter Types](https://looker.com/docs/reference/field-reference/dimension-type-reference#individual_time_and_date_types) docs page. All of the individual time based types start with `date_`. For example:

```
dimension: created_week {
  type: date_week
  sql: ${TABLE}.created_at ;;
}
```

<br />


## Next Step

Now that you have a grasp of dimensions and dimension groups, it's time to look at their sibling: measures.

<div style="float:left;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/6_dimension_options.md">&#10094; Dimension Options</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/8_measure_basics.md">Measure Basics &#10095;</a>
</div>
