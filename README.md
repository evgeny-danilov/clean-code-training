
# Clean code training exercises


## Exercise #1: Extract Local Variables 

An explaining variable is a variable whose name describes the purpose of the expression we're assigning to it. It's used to help break down longer, more complex expressions, making the final expression more manageable and easier to understand.

Solution: Check out [feature branch changes](https://github.com/jmelkor/clean-code-training/compare/ex1-extract-variables?diff=split)

## Exercise #2: Extract Private Methods

By extracting the functionality into private methods we get short and self-explained public methods. So, if developers or readers need more information about details, they could dive into the private section.

Another benefit of private methods against just local methods is that private methods are more flexible in terms of making additional changes or further refactoring. However, keeping the right balance between local variables and private methods is important for readability. Sometimes Rubocop could advise us to apply this technique, but most of the time we rely on our intuition and try to look at the code as an external reader, who barely knows the functionality.

Keep in mind, this technique is more convenient (and sometimes even possible) only in case our class has input parameters, coming through the initializer and defining it as instance variables / getters (`attr_reader`).

Another tip would be to keep our private methods as "clean functions". It prevents possible side effects and improves the readability of the code.

Solution: Check out [feature branch changes](https://github.com/jmelkor/clean-code-training/compare/ex2-extract-methods?diff=split)

## Exercise #3: Extract Classes

When class becomes bigger, it starts to violate SOLID principles, and turns into a mess of code that is difficult to understand. To make our lives easier and our code more flexible, we can extract some tightly-coupled functionality into a separate class. It gives us an additional dimension, so that we can move not only from top to bottom of a single file, but across a few files as well. 

Moreover, it helps us to hide some details, like "Extract Methods'' refactoring does, and additionally provides a new type of flexibility. In particular, when we have a separate class, it's much easier to move this part of functionality, for instance, by introducing Dependency Injection. Or, to add new behaviour, for instance, by introducing Strategy Pattern (these techniques in detail will be described in the exercises below).

Solution: Check out [feature branch changes](https://github.com/jmelkor/clean-code-training/compare/ex3-extract-classes?diff=split)

## Exercise #4: IF Statements refactoring

The first thing developers tend to use is applying `if` / `case` statements for business logic. However, the further we go, the more conditions we have. Eventually, we end up with absolutely unreadable and mind-blowing code. Every level of conditional nesting in a code forces readers to hold more mental context in the head.

Here is a few examples of what we can do:

Example #1: [Apply DeMorgan Laws](https://github.com/jmelkor/clean-code-training/compare/ex4a-de-morgan-laws?diff=split)

Example #2: [Extract Conditions](https://github.com/jmelkor/clean-code-training/compare/ex4b-extract-conditions?diff=split)

Example #3: [Replace `if` statements with guard clause](https://github.com/jmelkor/clean-code-training/compare/ex4c-remove-if-statements?diff=split)

## Exercise #5: Depenedency Injection

This technique is that we don't hardcode dependencies, but pass them as parameters into the class. By applying Dependency Injection we satisfy the Open-Close principle, and make the code loose couplied, e.g. more flexible in terms of changing the behaviour. However, don't overuse this technique when there is only one class-dependency, which will be relevant only for some part of the code (let's say, boundary context). So, sometimes it's better to violate DRY (don't repeat yourself), but keep your code less coupled.

Solution: Check out [feature branch changes](https://github.com/jmelkor/clean-code-training/compare/ex5-dependency-injection?diff=split)

## Exercise #6: Replace Conditionals

There are additional techniques to reduce count of `if` statements in order to keep the code extensible and to maintain Open-Close principle:

Example #1: [Replace Conditionals With Constant Hash](https://github.com/jmelkor/clean-code-training/compare/ex6a-replace-conditionals-with-hash?diff=split)

Example #2: [Replace Conditionals With Constant Strategies](https://github.com/jmelkor/clean-code-training/compare/ex6b-replace-conditionals-with-strategies-v2?diff=split), or, in some cases it could be like [this way](https://github.com/jmelkor/clean-code-training/compare/ex6b-replace-conditionals-with-strategies-v1?diff=split)

## Exercise #7: Mixins refactoring

Keep in mind, that having mixins is almost always not a good idea, because it brings a lot of Mystery Guests and leads to unexpected behaviour. However, if you desided to use mixins, it's better to hide the implementation into inner classes, so as not to pollute the namespace of method names in a target class.

Solution: Check out [feature branch changes](https://github.com/jmelkor/clean-code-training/compare/ex7-mixins-refactoring?diff=split)

# Training tasks
If you want to apply these techniques in real code, feel free to pick up these tasks and implement our own solution

Task #1: [Bottled Water Delivery](https://github.com/jmelkor/clean-code-training/tree/main/training-tasks/bottled_water_delivery?diff=split) service


# Links

1. ThoughtBot articles [with 'Clean Code' tag](https://thoughtbot.com/upcase/clean-code)
2. [99 Bottles of OOP](https://sandimetz.com/99bottles) by Sandy Meiz
3. [Code complete](https://www.amazon.com/Code-Complete-Practical-Handbook-Construction/dp/0735619670) by Steve McConnel (russian edition: [Совершенный код](https://www.ozon.ru/context/detail/id/140250413/)).
4. [Confident Ruby](https://pragprog.com/titles/agcr/confident-ruby/) by Avdi Grimm
5. [Practical Object-Oriented Design (2nd edition)](https://www.amazon.com/gp/product/B07F88LY9M/ref=dbs_a_def_rwt_hsch_vapi_tkin_p1_i1)  by Sandy Meiz