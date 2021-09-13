
# Clean code training exercises


## Exercise #1: Extract Local Variables 

An explaining variable is a variable whose name describes the purpose of the expression we're assigning to it. It's used to help break down longer, more complex expressions, making the final expression more manageable and easier to understand.

Solution: Check out [feature branch changes](https://github.com/jmelkor/clean-code-training/compare/ex1-extract-variables?diff=split)

## Exercise #2: Extract Private Methods

By extracting the functionality into private methods we get short and self-explained public methods. So, if developers or readers need more information about details, they could dive into the private section.

Another benefit of private methods against just local methods is that private methods are more flexible in terms of making additional changes or further refactoring. However, keeping the right balance between local variables and private methods is important for readability. Sometimes Rubocop could advise us to apply this technique, but most of the time we rely on our intuition and try to look at the code as an external reader, who barely knows the functionality (for more infomation, check out [The Local Variable Aversion Antipattern](https://www.soulcutter.com/articles/local-variable-aversion-antipattern.html))

Keep in mind, extracting private methods is more convenient (and sometimes even possible) only in case our class has input parameters, coming through the initializer and defining it as instance variables / getters (`attr_reader`).

Another tip would be to keep our private methods as "clean functions". It prevents possible side effects and improves the readability of the code.

Solution: Check out [feature branch changes](https://github.com/jmelkor/clean-code-training/compare/ex2-extract-methods?diff=split)

## Exercise #3: Extract Classes

When class becomes bigger, it starts to violate SOLID principles, and turns into a mess of code that is difficult to understand. To make our lives easier and our code more flexible, we can extract some tightly-coupled functionality into a separate class. It gives us an additional dimension, so that we can move not only from top to bottom of a single file, but across a few files as well. 

Moreover, it helps us to hide some details, like "Extract Methods'' refactoring does, and additionally provides a new type of flexibility. In particular, when we have a separate class, it's much easier to move this part of functionality, for instance, by introducing Dependency Injection. Or, to add new behaviour, for instance, by introducing Strategy Pattern (these techniques in detail will be described in the exercises below).

Solution: Check out [feature branch changes](https://github.com/jmelkor/clean-code-training/compare/ex3-extract-classes?diff=split)

**Drawbacks:** extracting classes decrease the complexity of the original class, but increase the overall complexity of the application. Besides, too many classes could lead to cyclomatic dependencies. All this means that more classes require developers to be more cautious, and the application architecture to be more strict, in order to force only one-way dependencies. 

So, If you extract classes in response to pain and resistance, you’ll end up with just the right number of classes and names.

## Exercise #4: IF Statements refactoring

The first thing developers tend to use is applying `if` / `case` statements for business logic. However, the further we go, the more conditions we have. Eventually, we end up with absolutely unreadable and mind-blowing code. Every level of conditional nesting in a code forces readers to hold more mental context in the head.

Here is a few examples of what we can do:

Example #1: [Apply DeMorgan Laws](https://github.com/jmelkor/clean-code-training/compare/ex4a-de-morgan-laws?diff=split)

Example #2: [Extract Conditions](https://github.com/jmelkor/clean-code-training/compare/ex4b-extract-conditions?diff=split)

Example #3: [Replace `if` statements with guard clause](https://github.com/jmelkor/clean-code-training/compare/ex4c-remove-if-statements?diff=split)

## Exercise #5: Depenedency Injection

This technique is that we don't hardcode dependencies, but pass them as parameters into the class. By applying Dependency Injection we satisfy the Open-Close principle, and make the code loose couplied, e.g. more flexible in terms of changing the behaviour.

In particulary, with this technique we move the dependency decision to a higher level component and remove any sub-dependencies from the lower level component. However, it’s important to remember that the further you move a dependency’s resolution from its use, the harder it is to figure out what’s actually being used in lower level components. Another thing you should know is that DI doesn't make a lot of sense, when there is always only one dependent class (e.g. we don't choose which class to inject). In fact, there are another solutions to manage tightly-coupled classes, and most of these solutions are comming from DDD.

Solution: Check out [feature branch changes](https://github.com/jmelkor/clean-code-training/compare/ex5-dependency-injection?diff=split)

## Exercise #6: Replace Conditionals

There are additional techniques to reduce count of `if` statements in order to keep the code extensible and follow Open-Close principle:

Example #1: [Replace Conditionals With Constant Hash](https://github.com/jmelkor/clean-code-training/compare/ex6a-replace-conditionals-with-hash?diff=split)

Example #2: [Replace Conditionals With Constant Strategies](https://github.com/jmelkor/clean-code-training/compare/ex6b-replace-conditionals-with-strategies-v2?diff=split), or, in some cases it could be like [this way](https://github.com/jmelkor/clean-code-training/compare/ex6b-replace-conditionals-with-strategies-v1?diff=split)

## Exercise #7: Mixins refactoring

Keep in mind that having mixins is almost always not a good idea, because it brings a lot of Mystery Guests and Cycle Dependencies, and leads to unexpected behaviour. For sure, better way would be to extract some functionality to a new class, which can be instantiated. However, if you desire to use mixins, it's better to hide implementation details in inner class, so as not to pollute the namespace of method names in a target class.

Solution: Check out [feature branch changes](https://github.com/jmelkor/clean-code-training/compare/ex7-mixins-refactoring?diff=split)

## Exercise #8: Form Objects

Value Objects provide the way to compact input params into one single Ruby object (PORO). An evolution of Value Objects are Form Objects. They provide more features to validate params and form error messages. Sometimes Form Objects include saving objects in DB, but we consider it as bad practice (working with DB is actually the area of Repositories / Query Objects).

So, Form Objects could be useful for:
- receiving inputs from web-forms
- parsing date from outside and generating the result
- communication between internal domains or external microservices
- transferring the set of parameters between classes within a domain / feature

Solution: Check out [feature branch changes](https://github.com/jmelkor/clean-code-training/compare/ex8a-form-objects?diff=split)

## Exercise #9: Prefer Simple code over Beautiful

Beautiful and short code doesn't always mean it's readablility. At the same time, more code lines can be more expressive. Some developers tend to dry out and cut the code, forgetting that people will have to put extra effort to understand. Besides, having less code often means reader should keep extra elements in short-term memory (some researchs shows people have only 5-7 slots in short-term memory to keep some independent elements there).

There are a lot of solutions and examples. Check out [one of them](https://github.com/jmelkor/clean-code-training/compare/ex9a-simplicitly-over-beauty?diff=split) - after this refactoring there are less variables, and we return from the method as soon as possible.

Other solution shows adding more variables to reduce less-readable functional styling. Check the [second example](https://github.com/jmelkor/clean-code-training/compare/ex9b-reduce-functional-styling?diff=split) - after the refactoring we get more expressive elements. Besides, it gives us the posibility to debub the code in more confinient way.

## PART 2 - DESIGN PATTERNS

...coming soon

## PART 3 - RAILS APP DESIGN

 


# Links

1. ThoughtBot articles [with 'Clean Code' tag](https://thoughtbot.com/upcase/clean-code)
2. [99 Bottles of OOP](https://sandimetz.com/99bottles) by Sandy Meiz
3. [Code complete](https://www.amazon.com/Code-Complete-Practical-Handbook-Construction/dp/0735619670) by Steve McConnel (russian edition: [Совершенный код](https://www.ozon.ru/context/detail/id/140250413/)).
4. [Confident Ruby](https://pragprog.com/titles/agcr/confident-ruby/) by Avdi Grimm
5. [Practical Object-Oriented Design (2nd edition)](https://www.amazon.com/gp/product/B07F88LY9M/ref=dbs_a_def_rwt_hsch_vapi_tkin_p1_i1)  by Sandy Meiz
6. [The Local Variable Aversion Antipattern](https://www.soulcutter.com/articles/local-variable-aversion-antipattern.html)