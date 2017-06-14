# Dimension Options

Dimensions have many other options that you can take advantage of. They are all documented on our [Field Parameters](https://looker.com/docs/reference/field-reference) doc, but we'll go over some of the most used options here.<br /><br />

#### primary_key

<font color="red">NEED TO ADD CONTENT FOR THIS</font>

#### link

The `link` parameter allows you to create links to other URLs that are related to your data. You specify a label that users will see, a URL that the link should go to, and optionally a link to an icon that users will see.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/products.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">products</a> View File</a>
</div>
```
dimension: brand {
  type: string
  sql: ${TABLE}.brand ;;
  link: {
    label: "Google Search"
    url: "http://www.google.com/search?q={{ value }}"
    icon_url: "http://google.com/favicon.ico"
  }
}
```

<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn2.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://looker.com/docs/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a>

You can insert dynamic values into the URL by using the liquid templating language, which is documented on our [html](https://looker.com/docs/reference/field-params/html#liquid_variables) parameter docs page.

#### case

The `case` parameter allows you to specify several SQL conditions, and the value that will appear to users if the condition is satisfied. This is similar to the SQL `CASE WHEN` function.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
dimension: price_range {
  case: {
    when: {
      sql: ${sale_price} < 20 ;;
      label: "inexpensive"
    }
    when: {
      sql: ${sale_price} >= 20 AND ${sale_price} < 100 ;;
      label: "normal"
    }
    when: {
      sql: ${sale_price} >= 100 ;;
      label: "expensive"
    }
    else: "unknown"
  }
}
```

<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn2.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://looker.com/docs/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a>

The conditions are evaluated in the order that you write them. As soon as one condition evalutes to true that label is assigned to that row of data.

#### value_format_name and value_format

The `value_format_name` and `value_format` parameters allow you to easily format dimensions for your users.

The `value_format_name` parameter lets you specify one of several pre-defined formats, which you can see listed in our <a href="(https://looker.com/docs/reference/field-params/value_format_name" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">value_format_name</a> doc. You can create additional named formats by using the <a href="(https://looker.com/docs/reference/model-params/named_value_format" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">named_value_format</a> parameter.

The `value_format` parameter allows you to specify formats that you don't think you'll want to use elsewhere. You can read about how to specify these formats in the <a href="(https://looker.com/docs/reference/field-params/value_format" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">value_format</a> doc.

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/order_items.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">order_items</a> View File</a>
</div>
```
dimension: sale_price {
  type: number
  sql: ${TABLE}.sale_price ;;
  value_format_name: usd
}
```

<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn2.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://looker.com/docs/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a>

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/products.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">products</a> View File</a>
</div>
```
dimension: cost {
  type: number
  sql: ${TABLE}.cost ;;
  value_format: "$0.00"
}
```

<a style="color:rgb(87,190,190);font-size:12px;margin-right:20px;" href="https://learn2.looker.com/explore/e_commerce/user_order_facts" target="_blank"><i class="fa fa-search"></i> Explore the <b>First Name</b> Dimension</a> <a style="color:rgb(32,165,222);font-size:12px;" href="https://looker.com/docs/reference/field-reference/dimension-type-reference#string" target="_blank"><i class="fa fa-file-text-o"></i> Read <b>type: string</b> Docs</a><br /><br />



## Next Step

The next topic to cover are dimension groups, which help deal with time based information efficiently.

<div style="float:left;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/5_dimension_types.md">&#10094; Dimension Types</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/7_dimension_groups.md">Dimension Groups &#10095;</a>
</div>
