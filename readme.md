Looks like the issue was how ACF 10 handles query results.

Rather than passing the query results directly into the `populate()` function, they needed to be converted to an actual struct, then passed in.

Thanks to Christoph Schmitz for pointing this out.