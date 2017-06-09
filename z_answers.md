This page includes the answers to all of the **Try it Yourself** questions throughout this tutorial.

<a name="dimension-basics"></a>

### Dimension Basics

*Question*

The orders table in our dataset has a column called traffic_source that hasn’t yet been added in LookML. Try adding it using the information you’ve learned.

*Answer*

```
dimension: traffic_source {
  type: string
  sql: ${TABLE}.traffic_source ;;
}
```
