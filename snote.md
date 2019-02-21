# Data Structure

## Java Interfaces

Interface looks similar to java *class*.

It can include variable declarations and methods.

  - all variables declared must be constants
  - all methods must be either *abstract* or *default*, and *static*
    - *abstract* method only includes a description of its parameters
    - no method bodies or implementations are allowed in *abstract* method
    - use keyword *abstract* when declaring an abstract method
  - *abstract* should **NOT** be used when we define methods in interface
    - It's redundant, because all **nonstatic** methods of an interface must be *abstract*
  - keyword *public* can be omitted as well
    - future versions of java may not support such use of unnecessary modifiers in interface

For example:

```java
public interface FigureInterface {
    final double PI = 3.14;
    double perimeter();
    double area();
}
```
Interfaces cannot be **instantiated**. 
Note that it is possible to **declare** a variable to be of an interface type. 
They can only be implemented by classes or extended by other interfaces. 
When implementing interface, the class must provide bodies to all abstract methods.

For example:

```java
public class Circle implements FigureInterface {
    protected double radius;

    public Circle(double radius) {
        this.radius = radius;
    }

    public double perimeter() {
        return 2 * PI * radius;
    }

    public double area() {
        return PI * radius * radius;
    }
}
```

Many different classes can all implement the same interface.

For example:

```java
public class Rectangle implements FigureInterface {
    protected double length, width;

    public Rectangle(double length, double width) {
        this.length = length;
        this.width = width;
    }

    public double perimeter() {
        return 2 * (length + width);
    }

    public double area() {
        return length * width;
    }
}
```


## Interface-Based Polymorphism

As long as a class implements an interface, we can instantiate an object of the class and assign it to an interface type variable.

For example:

```java
FigureInterface myFigure;
myFigure = new Circle(5);
myFigure = new Rectangle(2,4);

FigureInterface[] figures = new FigureInterface[2];
figures[0] = new Circle(5);
figures[1] = new Rectangle(2,4);
```

## Controlling Access to Members of a Class

There are two levels of access control

  - At the top level--*public*, or *package-private* (no explicit modifier)
  - At the member level--*public*, *private*, *protected*, or *package-private* (no explicit modifier).

The following shows the *access level* to members permitted by each modifier:

| Modifier      | Class | Package | Subclass | World |
| --------      | ----- | ------- | -------- | ----- |
| *public*      | Y     | Y       | Y        | Y     |
| *protected*   | Y     | Y       | Y        | N     |
| *no modifier* | Y     | Y       | N        | N     |
| *private*     | Y     | N       | N        | N     |

Assume *PackageOne* has two classes: Alpha and Beta. *PackageTow* has two classes: AlphaSub and Gamma. AlphaSub is the subclass of Alpha.

The folling table shows where the members of the Alpha class are visible for each of the access modifiers that can be applied to them:

| Modifier      | Alpha | Beta | AlphaSub | Gamma |
| --------      | ----- | ---- | -------- | ----- |
| *public*      | Y     | Y    | Y        | Y     |
| *protected*   | Y     | Y    | Y        | N     |
| *no modifier* | Y     | Y    | N        | N     |
| *private*     | Y     | N    | N        | N     |

## Stack Implementation

- The linked implementation does not have space limitations, and in applications where the number of stack elements can vary greatly, it  wastes less space when the stack is small.
- Array-based stack is short, simple, and efficient. If pushing occurs frequently, the array-based implementation executes faster than the link-based implementation because it does not incur the run-time overhead of repeatedly invoking the *new* operation.
- When the maximum size is small and we know the maximum size with certainty, the array-based implementation is a good choice.

## Generic collections

How we create generic collections using arrays in Java?

```java
public class ArrayBoundedStack<T> implements StackInterface<T> {

    protected final int DEFCAP = 100;
    protected T[] elements;
    protected topIndex;

    public ArrayBoundedStack() {
        // An unchecked cast warning is generated here
        elements = (T[]) new Object[DEFCAP];
        // Because the compiler cannot ensure that the array contains objects of class T
        // The warning can safely be ignored

        topIndex = -1;
    }

    public ArrayBoundedStack(int maxSize) {
        elements = (T[]) new Object[maxSize];
        topIndex = -1;
    }
}
```

Because java translator will not generate references to a generic type, our code must specify *Object* along with the *new* statement within our constructors.

Thus, we declare arrays of class T but instantiate them to be arrays of class *Object*, then **cast** array elements into class T.
