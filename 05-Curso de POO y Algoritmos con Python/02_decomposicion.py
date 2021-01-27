class Car:
    """Car"""

    def __init__(self, model, brand, color):
        self.model = model
        self.brand = brand
        self.color = color
        self._status = 'STOP'
        self._engine = Engine(cylinders=4)

    def speed(self, type_):
        if type_ == 'fast':
            self._engine.insert_gasoline(10)
        else:
            self._engine.insert_gasoline(3)
        self._status = 'RUN'


class Engine:
    """Engine"""

    def __init__(self, cylinders, type_='gasoline'):
        self.cylinders = cylinders
        self.type = type_
        self._temperature = 0

    def insert_gasoline(self, amount):
        pass
