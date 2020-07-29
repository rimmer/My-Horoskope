# Business Logic Components Pattern (BLoC) Modules

As with building almost any application, there’s always the need to handle application state. It is important that state management is handled efficiently, so as to avoid accruing technical debt, especially as your application grows and becomes more complex.

In Flutter, all UI components are widgets. As you start composing these widgets to create your awesome app, you’ll end up with a tree of deeply nested widgets. These widgets will most likely need to share application state with each other.

A BLoC stands as a middleman between a source of data in your app (e.g an API response) and widgets that need the data. It receives streams of events/data from the source, handles any required business logic and publishes streams of data changes to widgets that are interested in them.

The Best Practise is to use multiple blocs, one bloc per screen, at least.