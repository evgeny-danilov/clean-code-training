
# Clean code training exercises


## Exercise #1: Extract Local Variables 

An explaining variable is a variable whose name describes the purpose of the expression you're assigning to it. It's used to help break down longer, more complex expressions, making the final expression more manageable and easier to understand.

Solution: Check out [feature branch changes](https://github.com/jmelkor/clean-code-training/compare/ex1-extract-variables)

## Exercise #2: Extract Private Methods

By extracting the functionality into private methods we get short and self-explained public methods. So, if developers or readers need more information about details, they could dive into the private section.

Another benefit of private methods against just local methods is that private methods are more flexible in terms of making additional changes or further refactoring. However, keeping the right balance between local variables and private methods is important for readability. Sometimes Rubocop could advice us to apply this technique, but most of the time we rely on our intuition and try to look at the code as an external reader, who barely know the functionality.

Keep in mind, this technique is more convenient (and sometimes even possible) only in case our class has input parameters, coming through initializer and defining as instance varialbes / getters (`attr_reader`).

Another tip would be to keep you private methods as "clean functions". It prevents possible side effects and improves the readability of the code.

Solution: Check out [feature branch changes](https://github.com/jmelkor/clean-code-training/compare/ex2-extract-methods)

## Exercise #3: Extract Classes

When class becomes bigger, it starts to violate SOLID principles, and turns into a mess of code, that is difficult to understand. To make our live easier and out code more flexible, we can extract some tightly-coupled functionality into a separate class. It gives us an additional dimension, so that you can move not only from top to bottom of a single file, but accross a few files as well. 

Moreover, it helps you to hide some details, like "Extract Methods" refactoring does, and additionaly provides a new type of flexibility. In particular, when we have a separate class, it's much easier to move this part of functionality, for instance, by introducing Dependency Injection. Or, to add new behaviour, for instance, by introducing Strategy Pattern (these techniquecs in details will be described in the exercises below).

Solution: Check out [feature branch changes](https://github.com/jmelkor/clean-code-training/compare/ex3-extract-classes)

# Links

1. ThoughtBot acticles [with 'Clean Code' tag](https://thoughtbot.com/upcase/clean-code)
2. [Code complete](https://www.amazon.com/Code-Complete-Practical-Handbook-Construction/dp/0735619670) by Steve McConnel. Rus edition: [Совершенный код](https://www.ozon.ru/context/detail/id/140250413/)
3. [99 Bottles of OOP](https://sandimetz.com/99bottles) by Sandy Meiz