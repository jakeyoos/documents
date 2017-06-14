# Model Basics

In LookML, the primary function of a **model** is to house **explores**, and to define certain high-level settings such as with database connection should be used. We'll talk about explores in the next lesson, and focus on the model-level settings in this lesson.

Unlike the LookML items you've seen so far, there is no parameter to create a model. Instead, a model is created by adding a model file. In this case, you'll see a single model file called <a href="https://learn2.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> on the left hand side of the screen.<br /><br />



## Anatomy of a Model

You'll see that the top of our <a href="https://learn2.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> model file looks like this:

<div style="border-radius:5px 5px 0 0;padding:8px;background-color:rgb(221,221,221);">
 From the <a href="https://learn2.looker.com/projects/e-commerce/files/e_commerce.model.lkml" style="font-family:Monaco,Menlo,Consolas,Courier New,monospace;">e_commerce</a> Model File</a>
</div>
```
connection: "thelook_events"
include: "*.view.lkml"
```

If we break this down:

+ The first row `connection: "thelook_events"` determines which database connection this  model will query. Database connections are setup by Looker admins, and you can read about them in our [Connections](https://looker.com/docs/admin-options/database/connections) docs page.

+ The second row `include: "*.view.lkml"` makes all of our view files available to the model. You'll notice we're using the wildcard `*` to do this, but if you only want certain view files included, you could list the files individually like `include: "orders.view.lkml"`.

You’ll notice there are a lot of explores defined within the model, but we’ll discuss those separately in our next lesson.<br /><br />



## Other Model Settings

All of the additional model level settings that you can apply in LookML can be found on our [Model Parameters](https://looker.com/docs/reference/model-reference) docs page.<br /><br />



## Next Step

Next, we'll look at creating explores, which make models useful.

<div style="float:left;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/10_measure_options.md">&#10094; Measure Options</a>
</div>

<div style="float:right;font-weight:bold;">
  <a href="https://learn2.looker.com/projects/e-commerce/files/12_explore_basics.md">Dimension Types &#10095;</a>
</div>
