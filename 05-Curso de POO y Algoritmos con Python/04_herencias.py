class Rectangle:
    """Rectangle"""
    def __init__(self, height, width):
        self.height = height
        self.width = width

    def area(self):
        return self.height * self.width


class Square(Rectangle):
    """Square"""
    def __init__(self, side):
        super(Square, self).__init__(side, side)


if __name__ == '__main__':
    rectangle = Rectangle(height=3, width=4)
    print(rectangle.area())

    square = Square(side=5)
    print(square.area())