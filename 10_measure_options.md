# Measure Options

Measures have many other options that you can take advantage of. They are all documented on our [Field Parameters](https://looker.com/docs/reference/field-reference) doc, but we'll go over some of the most used options here.<br /><br />

#### drill_fields

In Looker, when a user clicks on a measure, there is an option to show all of the records that comprise that measure when it is clicked. This is called drilling, and it's easiest to understand with counts. For example, if a measure showed a count of 20 orders, the user could click on it to see information listed about each of those 20 orders. In theory you can also enable this feature for non-count measures, but it's not as obvious what's happening. For example, if a user clicked on a total of $1,000 in sales, the drill would show the orders that comprised those sales.

The parameter that turns on this feature is called `drill_fields`. It accepts a list of fields that you would like to show when a user clicks on a measure.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
measure: count {
  type: count
  drill_fields: [id, last_name, first_name]
}
```

<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn2.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://looker.com/docs/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a>

#### filters

Another very useful feature of measures is to filter them. While you can of course apply filters on the Explore page, those filters will get applied to *everything*, whereas this feature allows you to filter *only* a specific measure. For example, our <a href="https://learn2.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> view has a regular count, but we can also create a count of only men and only women:


<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> View File</a>
</div>
```
measure: men_count {
  type: count
  filters: {
    field: gender
    value: "Male"
  }
}

measure: female_count {
  type: count
  filters: {
    field: gender
    value: "Female"
  }
}
```

<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn2.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://looker.com/docs/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a>

The `filters` parameter works by first specifying the dimension you want to filter on, and then the value you want to set it equal to. In the "men_count" example above, we're saying that we want to filter the count by setting the gender dimension equal to Male.<br /><br />



## Next Step

With a solid grasp of views and the fields that live within them, we can now move onto understanding model files and how to link views together.

<div style="float:left;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/9_measure_types.md">&#10094; Measure Types</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/11_model_basics.md">Model Basics &#10095;</a>
</div>
