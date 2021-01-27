class Person:
    """Person"""
    def __init__(self, name):
        self.name = name

    def go(self):
        print("I'm going walking")


class Cyclist(Person):
    """Cyclist"""
    def __init__(self, name):
        super(Cyclist, self).__init__(name)

    def go(self):
        print("I'm going with my bicycle")


def main():
    person = Person('David')
    person.go()

    cyclist = Cyclist('Daniel')
    cyclist.go()


if __name__ == '__main__':
    main()
