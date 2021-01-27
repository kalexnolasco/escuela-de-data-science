class Coordinate:
    """Coordinate"""
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def distance(self, other_coordinate):
        x_diff = pow(self.x - other_coordinate.x, 2)
        y_diff = pow(self.y - other_coordinate.y, 2)

        distance = pow(x_diff + y_diff, 1/2)
        return distance


if __name__ == '__main__':
    coordinate_1 = Coordinate(3, 30)
    coordinate_2 = Coordinate(4, 8)
    distance_1_to_2 = coordinate_1.distance(coordinate_2)
    print(f' The distance is {distance_1_to_2}')
    print('coordinate_1 is Coordinate object --> {}'.format(isinstance(coordinate_1, Coordinate)))
    print('3 is Coordinate object --> {}'.format(isinstance(3, Coordinate)))
