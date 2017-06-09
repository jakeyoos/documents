# Basic Dimensions

The proper way to think of a dimension is as a non-aggregate calculation based on column data. That sounds a lot more complicated than it is, so let's unpack it.

By "non-aggregate" we mean that a dimension represents the values in each individual row of a database table. For example, a dimension could represent each name listed in a name column. What it could *not* represent would be a count of names in multiple rows. Calculations based on multiple rows are called measures, which we'll cover later.

By "calculation based on column data" we mean that a dimension is based on your database columns. It could be very simple, and just take the values from a single column as-is. Or, it could be more complicated, with some calculation based on multiple columns. We'll see some examples of both simple and complex dimensions as we go.<br /><br />


# Anatomy of a Dimension

All dimensions need *at least* a name, a type, and a SQL definition.  For example, the <a href="https://learn2.looker.com/projects/e-commerce/files/users.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">users</a> view file has a dimension called `first_name` inside of it:

```
dimension: first_name {
  type: string
  sql: ${TABLE}.first_name ;;
}
```

If we break this down:

+ The first row `dimension: first_name {` creates a dimension with the name of `first_name`.

+ The second row `type: string` gives the dimension a type. All of the possible types are defined on our [Dimension and Filter Types](https://looker.com/docs/reference/field-reference/dimension-type-reference) docs page, but we'll also go over them in the [next lesson](https://learn2.looker.com/projects/e-commerce/files/3_dimension_types.md).

+ The third row `sql: ${TABLE}.first_name ;;` defines how the dimension should be calculated. Any SQL that your database supports can be written here, as long as it is not an aggregate, and as long as the result matches the `type` of the dimension you've chosen. For example, you shouldn't write SQL that results in a number if you've chosen a type of "string".

  The pattern `${TABLE}.column_name` is super common in LookML development. The `${TABLE}` variable will automatically add the appropriate database table to your `sql` definition. It does this by determining the database table that is associated with the view where the dimension lives. We'll talk about how to associate a database table with a view in a later lesson.

  Also note that the `sql` parameter ends with two semi-colons (`;;`). This is how Looker knows you're done writing SQL, and it allows you to use as many rows as you like when you write your SQL. It's fairly common for new developers to forget this.

+ The last row `}` closes the dimension.<br /><br />



# More Examples
