# LookML Basics

Welcome to our e-commerce tutorial. Unlike the [Name Game](https://learn2.looker.com/projects/name_game/files/lesson_1_text.md), this tutorial goes into considerbally more detail about how to develop in LookML. Since LookML has so many options, this tutorial won't cover every possible option, but it will cover enough to cover almost all common use cases.

The data set we're working with here is sales data from an e-commerce clothing store. It has a few, relatively straightforward data tables:

<div style="border:1px solid black;padding:10px;text-align:center;">
ERD Diagram of the_look
</div><br />

As mentioned in the intro, you should have a basic comfort level with SQL in order to get the most out of this tutorial and Looker.<br /><br />



# The Fundamental LookML Structures

There are a few fundamental structures from which you'll build almost everything in LookML:

**Fields** - In general, each bit of data that your users are going to choose from will be represented as a LookML field. There are 4 different types of fields:

+ *Dimensions* - An easy way to think of dimensions is that they represent a column of data in a database table, or a transformation or combination of columns. There are some nuances which we'll define with more precision in our [next lesson](https://learn2.looker.com/projects/e-commerce/files/2_dimension_basics.md).

+ *Dimension Groups* - Dimension groups allow you to create many dimensions all at once, which saves time. Currently, they're solely for use with time based data.

+ *Measures* - Measures provide information about the dimensions (i.e. groups of data) that users choose. They're represented as aggregate functions - like `COUNT`, `SUM`, and `MAX` - in the SQL query that Looker builds.

+ *Filters* - It's important to note that, in general, you don't need to explicitly create filters for your users. The dimensions and measures you create will automatically be available to your users as filters. However, there are some advanced use cases where you need to create a filter that *doesn't* have a dimension or measure associated with it. We don't be covering this type of field in this tutorial, but you can read about them in our [Templated Filter](https://looker.com/docs/data-modeling/learning-lookml/templated-filters) doc if you like.

**Views** - Views represent the tables in your database. Or, you can create your own tables within Looker, and then make that into a view.

**Explores** - Explores define which views will be made available to users in the Explore menu at the top of the page. You can also define the join relationships between multiple views to create explores that contain information from multiple views.

**Models** - Models are the place where you will define your explores. In *general* you'll have one model per database. However, Looker doesn't enforce any rules about how many models you can have, so you can use multiple models to organize things however you like.<br /><br />



# Where are These Structures Defined?

**Fields** live inside of views.

**Views** are stored in view files, which you'll see listed on the left hand side of this page. Techncially speaking you can define more than one view inside a single view file, but we discourage it, because it can be hard to find things. Similarly, we suggest that you name your view files according to the view that's inside them. Feel free to check out the <a href="https://learn2.looker.com/projects/e-commerce/files/orders.view.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">orders</a> view file if you want to see what a view - and its fields - looks like. We'll explain all of their contents in subsequent lessons.

**Explores** live inside of models.

**Models** are stored in model files, which you'll also see listed on the left hand side of this page. By definition, there is only one model per model file. This is because you create a model by creating its file. The model name is the name of the file. Feel free to check out the <a href="https://learn2.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> model file if you want to see what a model - and its explores - looks like. We'll explain all of their contents in subsequent lessons.<br /><br />



## Next Step

Let's start by looking at the basics of dimensions.

<div style="float:right;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/2_dimension_basics.md">Dimension Basics &#10095;</a>
</div>
