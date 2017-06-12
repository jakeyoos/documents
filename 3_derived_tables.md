# Derived Tables

If you need to, you can create database tables using Looker. This feature is called "derived tables", which you can read about in more detail in our [Derived Tables](https://looker.com/docs/data-modeling/learning-lookml/derived-tables) documentation.

Derived tables can be calculated on the fly each time they're queried, or they can be stored in your database. If you want derived tables to be storable, your admins will have needed to enable that feature when they setup Looker.

When you create a derived table, you'll write a SQL query against your database. The results of that query are then treated as a table within Looker. You can then use that table as normal to create dimensions, measures, etc. in LookML.

<div style="border:2px solid rgb(141,127,185);border-radius:5px;padding:8px;">
<span style="font-weight:bold;color:rgb(141,127,185);">Best Practice Alert</span><br /><br />

If you're familiar with SQL or traditional business intelligence tools, you may be tempted to overuse derived tables. They certainly have valuable and powerful uses, but they are also static. Use regular LookML modeling when possible to create more dynamic and re-usable LookML that gives your users more freedom.<br /><br />

Also, you might be tempted to use derived tables to improve query performance, which <i>is</i> a valid strategy in some contexts. However, many modern databases are so fast that this is unnecessary. Consult your database admins if you're considering this route.
</div><br /><br />



## Anatomy of a Derived Table

Derived tables only require you to specify their SQL. For example, the top of the <a href="https://learn2.looker.com/projects/e-commerce/files/user_order_facts.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">user_order_facts</a> view file looks like this:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/user_order_facts.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">user_order_facts</a> View File</a>
</div>
```
view: user_order_facts {
  derived_table: {
    sql:
      SELECT
        user_id,
        MIN(DATE(created_at)) AS first_order_date
      FROM
        users
      GROUP BY
        customer_id ;;
    persist_for: "24 hours"
}
```

If we break this down:

+ The first row `view: user_order_facts {` creates a view with the name of `user_order_facts`.

+ The second row `derived_table` declares the the view is going to be a derived table.

+ The third row `sql:` starts the section of LookML where you'll write the query for the derived table.

+ The fourth to tenth row contain the actual SQL. Remember to end the SQL with `;;`

+ The eleventh row `persist_for: "24 hours"` tells Looker to store the results for 24 hours at a time. If this row was excluded, Looker would calculate the table every time it was used in a query.<br /><br />



## Understanding Persistence

In the example above, we saw one option for setting persistence: `persist_for: "24 hours"`. However, there are other persistence options available. It's also important to understand some of the details about how persistence works and the impact that it can have. Please read our [Derived Tables](https://looker.com/docs/data-modeling/learning-lookml/derived-tables#adding_persistence) documentation to fully understand this feature.<br /><br />



## Other Derived Table Settings

All of the additional derived tables settings that you can apply in LookML can be found on our [View Parameters](https://looker.com/docs/reference/view-reference) docs page.<br /><br />



## Next Step

Next, we'll look at the basics of dimensions.

<div style="float:left;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/2_view_basics.md">&#10094; View Basics</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/4_dimension_basics.md">Dimension Basics &#10095;</a>
</div>
